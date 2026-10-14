# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tracing
      class << self
        # A failure to record must not fail the application's code, so an error raised in the block
        # is logged, and the value is then `nil`.
        #
        # @param what [String]
        def recording(what)
          yield
        rescue StandardError => e
          OpenTelemetry.logger.debug("anthropic: could not record #{what} on its span: #{e.class}")
          nil
        end

        # The enumerator that reads `events` and records the Message they carry on `span`, and what
        # it has recorded so far.
        #
        # @param span [OpenTelemetry::Trace::Span]
        # @param events [Enumerable<Anthropic::Internal::Type::BaseModel>] the events of the stream
        # @param params [Hash{Symbol=>Object}] the request's body
        # @param start_time [Float] when the API call started, on the monotonic clock
        # @param content [Boolean] whether the span has the `content` attributes
        # @param content_limit [Integer] the most bytes the `content` attributes hold
        #
        # @return [Array(Enumerator, Anthropic::Helpers::Tracing::StreamedMessage)]
        def follow_streamed_message(span, events, params:, start_time:, content:, content_limit: CONTENT_LIMIT)
          tracker = StreamedMessage.new(
            span,
            params: params,
            start_time: start_time,
            content: content,
            content_limit: content_limit
          )
          recording = Enumerator.new do |y|
            events.each do |event|
              tracker.observe(event)
              y << event
            end
            tracker.ended_by_server
          ensure
            tracker.set_attributes
          end
          # The SDK closes a stream by rewinding its enumerator. That does not resume a read
          # suspended in `Enumerator#next`, whose `ensure` would never run, so the Message is
          # recorded here too.
          recording.define_singleton_method(:rewind) do
            tracker.set_attributes
            events.rewind
            self
          end
          [recording, tracker]
        end

        # Runs the block, in which a stream helper folds one event into the Message it accumulates,
        # and gives that Message to the span that follows `stream`, when one does. An event that the
        # block fails on leaves the span without the Message.
        #
        # @param stream [Anthropic::Internal::Type::BaseStream] the raw stream that the helper reads
        #
        # @return [Anthropic::Models::Message, Anthropic::Models::Beta::BetaMessage]
        def accumulate_streamed_message(stream)
          tracker = stream.streamed_message if stream.is_a?(Anthropic::Internal::TracedStream)
          tracker&.snapshot = nil
          message = yield
          tracker&.snapshot = message
          message
        end
      end

      # What a span records of a streamed Message, as far as the stream has been read. None of its
      # methods raises. The content is not rebuilt here: it comes from the Message that a stream
      # helper accumulates ({Tracing.accumulate_streamed_message}), so a raw stream has none.
      class StreamedMessage
        # The counts of `message_start` that a later `message_delta` replaces with the final ones.
        PROVISIONAL_USAGE = [:output_tokens, :output_tokens_details, :iterations].freeze

        # @param value [Anthropic::Models::Message, Anthropic::Models::Beta::BetaMessage, nil]
        attr_writer :snapshot

        # @param span [OpenTelemetry::Trace::Span]
        # @param params [Hash{Symbol=>Object}] the request's body
        # @param start_time [Float] when the API call started, on the monotonic clock
        # @param content [Boolean] whether the span has the `content` attributes
        # @param content_limit [Integer] the most bytes the `content` attributes hold
        def initialize(span, params:, start_time:, content:, content_limit: CONTENT_LIMIT)
          @span = span
          @params = params
          @start_time = start_time
          @content = content
          @content_limit = content_limit
          @timed = false
          @message = nil
          @snapshot = nil
          @stopped = false
          @recorded = false
        end

        # @param event [Anthropic::Internal::Type::BaseModel]
        def observe(event)
          Tracing.recording("a streamed message") { fold(event) }
        end

        # `[]` reads a field of an event as it is, so nothing is converted: a stream is mostly content
        # deltas, which cost nothing here after the first.
        #
        # @param event [Anthropic::Internal::Type::BaseModel]
        private def fold(event)
          case event[:type].to_sym
          in :message_start
            message = event[:message]
            @message = {
              id: message[:id],
              model: message[:model],
              usage: message[:usage].to_h.except(*PROVISIONAL_USAGE)
            }
          in :content_block_start if @message && event[:content_block][:type].to_sym == :fallback
            @message[:model] = event[:content_block][:to][:model]
          in :content_block_delta unless @timed
            @timed = true
            @span.set_attribute(
              GEN_AI_RESPONSE_TIME_TO_FIRST_CHUNK,
              Anthropic::Internal::Util.monotonic_secs - @start_time
            )
          in :message_delta unless @message.nil?
            event[:usage].to_h.each do |key, value|
              # The cache writes by lifetime come from `message_start` only.
              @message[:usage][key] = value unless value.nil? || key == :cache_creation
            end
            stop_reason = event[:delta][:stop_reason]
            @message[:stop_reason] = stop_reason unless stop_reason.nil?
          in :message_stop
            @stopped = true
          else
            nil
          end
        end

        # The server ending the stream is the only end that sets a status here: `OK` after
        # `message_stop`, and `api_error` before it, where the server cut the stream short.
        def ended_by_server
          # A second read of the stream ends at once, after the span.
          return if @recorded

          Tracing.recording("a streamed message") do
            if @stopped
              @span.status = OpenTelemetry::Trace::Status.ok
            else
              @span.status = OpenTelemetry::Trace::Status.error
              @span.set_attribute(Anthropic::Internal::Tracing::ERROR_TYPE, "api_error")
            end
          end
        end

        # Only the first call does anything.
        def set_attributes
          return if @recorded

          @recorded = true
          Tracing.recording("a streamed message") do
            unless @message.nil?
              Anthropic::Internal::Tracing.set_response_attributes(
                @span,
                Anthropic::Internal::Tracing::SpanName::MESSAGES_CREATE,
                @message
              )
              Tracing.set_computed_usage_attributes(@span, @message[:usage])
            end
          end
          set_content
        end

        # The content of the request is written again with the output, so that the size bound counts both.
        private def set_content
          return if !@content || @snapshot.nil?

          Tracing.recording("a streamed message") do
            content = @snapshot.content
            # The input of a tool use is the text of its JSON until its block ends, and `arguments` holds an object.
            content = content&.map { _1[:input].is_a?(String) ? {**_1.to_h, input: {}} : _1 } unless @stopped
            Tracing.set_message_content_attributes(@span, @params, content, limit: @content_limit)
          end
        end
      end
    end
  end
end
