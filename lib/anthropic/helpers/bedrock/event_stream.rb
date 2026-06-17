# frozen_string_literal: true

module Anthropic
  module Helpers
    module Bedrock
      # @api private
      #
      # Bedrock's `invoke-with-response-stream` returns
      # `application/vnd.amazon.eventstream` (AWS binary event-stream framing),
      # not SSE. The SDK's stream consumer parses SSE only — without this
      # transcoder a Bedrock stream silently yields zero events. Each frame's
      # payload is `{"bytes": "<base64>"}` wrapping a standard Anthropic event
      # JSON; this re-emits those as `event:`/`data:` SSE bytes so the existing
      # `Internal::Util.decode_sse` and the streaming helpers work unchanged.
      module EventStream
        AWS_CONTENT_TYPE = %r{^application/vnd\.amazon\.eventstream}

        class << self
          # @api private
          #
          # Transcodes the raw AWS event-stream byte chunks into SSE-formatted
          # byte chunks. Incremental: each input chunk is fed to
          # `Aws::EventStream::Decoder` and any complete frames are emitted
          # immediately, so the stream is not buffered end-to-end.
          #
          # @param chunks [Enumerable<String>] raw response body chunks
          # @return [Enumerable<String>] SSE-formatted body chunks
          def to_sse(chunks)
            # `aws-eventstream` ships with `aws-sdk-core`, which the Bedrock
            # client already lazy-requires before any request can fire.
            require("aws-eventstream")
            decoder = Aws::EventStream::Decoder.new
            Anthropic::Internal::Util.chain_fused(chunks) do |y|
              chunks.each { |chunk| drain(decoder, chunk, y) }
              drain(decoder, nil, y)
            end
          end

          # @api private
          #
          # Feeds one chunk (or `nil` to flush) into the decoder and emits any
          # complete frames as SSE bytes.
          #
          # @param decoder [Aws::EventStream::Decoder]
          # @param chunk [String, nil]
          # @param y [Enumerator::Yielder]
          # @return [void]
          def drain(decoder, chunk, y)
            loop do
              msg, eof = decoder.decode_chunk(chunk)
              chunk = nil
              break if msg.nil?
              emit(msg, y)
              break if eof
            end
          end

          # @api private
          #
          # Emit one decoded AWS event-stream message as SSE bytes.
          #
          # `:message-type: event` frames carry a JSON payload
          # `{"bytes": "<base64>"}` wrapping the Anthropic event; emit it as
          # an `event:`/`data:` pair. `:message-type: exception` frames carry an
          # error payload and a `:exception-type` header — re-emit as the same
          # `event: error` / `data: {"type":"error",...}` SSE shape the API
          # would have sent, so the stream consumer's existing error path fires.
          #
          # @param msg [Aws::EventStream::Message]
          # @param y [Enumerator::Yielder]
          # @return [void]
          def emit(msg, y)
            case msg.headers[":message-type"]&.value
            in "event"
              payload = JSON.parse(msg.payload.read, symbolize_names: true)
              inner = Base64.decode64(payload.fetch(:bytes))
              type = JSON.parse(inner, symbolize_names: true).fetch(:type)
              y << "event: #{type}\ndata: #{inner}\n\n"
            in "exception"
              exc_type = msg.headers[":exception-type"]&.value
              body = msg.payload.read
              data = JSON.generate(type: "error", error: {type: exc_type, message: body})
              y << "event: error\ndata: #{data}\n\n"
            else
              # Unknown message-type — drop. AWS may add prelude/metadata frames.
            end
          end
        end
      end
    end
  end
end
