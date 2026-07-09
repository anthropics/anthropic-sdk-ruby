# frozen_string_literal: true

module Anthropic
  module Helpers
    module Sessions
      # Accumulates session stream events into `agent.message` snapshots.
      #
      # `event_delta` previews are lossy and best-effort; the buffered final
      # `agent.message` event is canonical and replaces whatever the preview
      # accumulated. A `span.model_request_end` event closes all open previews
      # (the producing model request ended without emitting the buffered
      # event), discarding their partial snapshots.
      #
      # @example
      #   accumulator = Anthropic::Helpers::Sessions::EventAccumulator.new
      #   accumulator.wrap(stream).each do |event|
      #     print accumulator.agent_message_text(event.event_id) if event.type == :event_delta
      #   end
      class EventAccumulator
        # Raised when the delta stream is malformed: an `event_delta` whose
        # `event_start` was never seen, or whose index is out of range for the
        # accumulated content.
        class AccumulationError < Anthropic::Errors::Error
        end

        # Snapshots keyed by event id, including those still accumulating.
        # While a preview is open the snapshot is partial and its
        # `processed_at` is unset; once the buffered final `agent.message`
        # arrives it is the canonical event.
        #
        # @return [Hash{String => Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent}]
        attr_reader :agent_messages

        def initialize
          @agent_messages = {}
        end

        # Folds one stream event into the accumulated state and returns the
        # event unchanged.
        #
        # @param event [Anthropic::Models::Beta::Sessions::BetaManagedAgentsStreamSessionEvents]
        #
        # @raise [Anthropic::Helpers::Sessions::EventAccumulator::AccumulationError]
        #   on an `event_delta` whose `event_start` was never seen, or whose
        #   index is out of range for the accumulated content.
        #
        # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsStreamSessionEvents]
        def accumulate(event)
          case event.type
          in :event_start
            on_event_start(event)
          in :event_delta
            on_event_delta(event)
          in :"agent.message"
            @agent_messages[event.id] = event
          in :"span.model_request_end"
            # The model request ended without buffering the previewed events
            # (an error or interrupt mid-stream); discard the open previews.
            # Canonical events (`processed_at` set) survive.
            @agent_messages.delete_if { |_, message| message.processed_at.nil? }
          else
            # Other event types carry no `agent.message` content.
          end
          event
        end

        # Returns an Enumerator that lazily folds each event from `enum`
        # through {#accumulate} and yields it unchanged. The enumerator is
        # fused: it can be consumed once, and re-iterating yields nothing
        # rather than folding deltas a second time.
        #
        # @param enum [Enumerable<Anthropic::Models::Beta::Sessions::BetaManagedAgentsStreamSessionEvents>]
        #
        # @return [Enumerator<Anthropic::Models::Beta::Sessions::BetaManagedAgentsStreamSessionEvents>]
        def wrap(enum)
          Anthropic::Internal::Util.chain_fused(enum) do |yielder|
            enum.each { yielder << accumulate(_1) }
          end
        end

        # The concatenated text of the accumulated `agent.message` with the
        # given event id, or `nil` when the id is unknown.
        #
        # @param event_id [String]
        #
        # @return [String, nil]
        def agent_message_text(event_id)
          @agent_messages[event_id]&.content&.filter_map { _1.text if _1.type == :text }&.join
        end

        private

        def on_event_start(event)
          # `agent.thinking` previews are start-only today; deltas may come later.
          return unless event.event.type == :"agent.message"

          id = event.event.id
          # `processed_at` is left unset: that is what marks the snapshot as an
          # open preview until the buffered final event reconciles it.
          @agent_messages[id] = Anthropic::Beta::Sessions::BetaManagedAgentsAgentMessageEvent.new(
            id: id,
            type: :"agent.message",
            content: []
          )
        end

        def on_event_delta(event)
          snapshot = @agent_messages[event.event_id]
          if snapshot.nil?
            raise AccumulationError.new(
              "event_delta for #{event.event_id} received before its event_start"
            )
          end

          # The final event is canonical; drop deltas that straggle in after it.
          return unless snapshot.processed_at.nil?

          index = event.delta.index || 0
          fragment = event.delta.content
          content = snapshot.content

          # Indices arrive in order — the first delta at a new index opens the
          # slot. A gap means deltas arrived out of order or were mis-routed.
          unless (0..content.length).cover?(index)
            raise AccumulationError.new(
              "event_delta index #{index} is beyond the end of content (length #{content.length})"
            )
          end

          existing = content[index]
          if existing.nil?
            # Copy the fragment so later appends never mutate the wire event.
            block = Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock.new(
              type: fragment.type,
              text: fragment.text
            )
            snapshot.content = content + [block]
          elsif fragment.type == :text && existing.type == :text
            existing.text += fragment.text
          else
            # Unrecognised fragment type: no-op; the canonical event fills the gap.
          end
        end
      end
    end
  end
end
