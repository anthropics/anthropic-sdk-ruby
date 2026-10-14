# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tracing
      # The most bytes the `content` attributes of one span hold, unless the client's
      # `max_content_bytes` sets another bound.
      CONTENT_LIMIT = Anthropic::Internal::Tracing::DEFAULT_MAX_CONTENT_BYTES

      class << self
        # @param span [OpenTelemetry::Trace::Span]
        # @param body [Hash{Symbol=>Object}]
        # @param output [Array<Object>, nil] the response's content, once complete
        # @param limit [Integer] the most bytes the `content` attributes hold
        def set_message_content_attributes(span, body, output, limit: CONTENT_LIMIT)
          body = symbolize_keys(body.slice(:messages, :system, :stop_sequences))
          output = [{role: "assistant", parts: parts(output)}] unless output.nil?
          stop_sequences = body[:stop_sequences]
          set_content_attributes(
            span,
            messages(body[:messages]),
            {
              GEN_AI_SYSTEM_INSTRUCTIONS => (parts(body[:system]) unless body[:system].nil?),
              GEN_AI_OUTPUT_MESSAGES => output
            },
            stop_sequences: (text_array(stop_sequences) if stop_sequences.is_a?(Array)),
            limit: limit
          )
        end

        # `nil` when `string` is not text in its encoding: an exporter fails on a string that is not
        # valid UTF-8, which would lose every span it exports with it.
        #
        # @param string [String]
        #
        # @return [String, nil]
        def utf8_text(string)
          text =
            if string.encoding == Encoding::BINARY
              string.dup.force_encoding(Encoding::UTF_8)
            else
              string.encode(Encoding::UTF_8)
            end
          text if text.valid_encoding?
        rescue EncodingError
          nil
        end

        # `nil` when any item is not text ({utf8_text}).
        #
        # @param array [Array<Object>]
        #
        # @return [Array<String>, nil]
        def text_array(array)
          texts = array.map { utf8_text(_1.to_s) }
          texts unless texts.any?(&:nil?)
        end

        # @param content [String, Array<Object>, nil]
        #
        # @return [Array<Hash{Symbol=>Object}>]
        def parts(content)
          case content
          in String
            [{type: "text", content: content}]
          in Array
            content.map { part(_1) }
          else
            []
          end
        end

        # The content blocks of a `tool_result` block. A `text` or `search_result` block keeps its
        # fields ({result_value}), and any other block only its type.
        #
        # @param content [String, Array<Object>, nil]
        #
        # @return [Array<Object>]
        def tool_result_content(content) = tool_result_blocks(symbolize_keys(content))

        # A deep copy of `value` whose Hashes have Symbol keys, and whose models are such Hashes.
        #
        # @param value [Object]
        #
        # @return [Object]
        def symbolize_keys(value)
          case value
          in Hash
            value.to_h { |key, item| [key.is_a?(String) ? key.to_sym : key, symbolize_keys(item)] }
          in Array
            value.map { symbolize_keys(_1) }
          in Anthropic::Internal::Type::BaseModel
            symbolize_keys(value.to_h)
          else
            value
          end
        end

        # The `content` of a result block other than `tool_result`, such as `web_search_tool_result`.
        #
        # @param content [String, Array<Object>, Hash{Symbol=>Object}, Anthropic::Internal::Type::BaseModel, nil]
        #
        # @return [Array<Object>, Hash{Symbol=>Object}]
        def result_block_content(content)
          case content
          in nil
            []
          in String
            [{type: "text", text: content}]
          in Array
            content.map do
              type = block_type(_1)
              %w[text search_result web_search_result].include?(type) ? result_value(_1) : {type: type}
            end
          else
            result_value(content)
          end
        end

        # `value` without its `encrypted_*` fields, which are opaque, and without image and document
        # data, which is large and binary.
        #
        # @param value [Object]
        #
        # @return [Object]
        def result_value(value)
          case value
          in Hash | Anthropic::Internal::Type::BaseModel
            type = block_type(value)
            return {type: type} if %w[image document].include?(type)

            fields = value.to_h.reject { |name, _| name.to_s.start_with?("encrypted_") }
            view = type == "text_editor_code_execution_view_result"
            fields = fields.except(:content) if view && %w[image pdf].include?(fields[:file_type].to_s)
            fields.transform_values { result_value(_1) }
          in Array
            value.map { result_value(_1) }
          else
            value
          end
        end

        # @param block [Hash{Symbol=>Object}, Anthropic::Internal::Type::BaseModel]
        #
        # @return [String]
        def block_type(block)
          case block[:type]
          in String | Symbol => type
            type.to_s
          else
            "unknown"
          end
        end

        # @param block [Hash{Symbol=>Object}, Anthropic::Internal::Type::BaseModel]
        #
        # @return [Hash{Symbol=>Object}]
        def part(block)
          case block_type(block)
          in "text"
            {type: "text", content: block[:text].to_s}
          in "thinking"
            {type: "reasoning", content: block[:thinking].to_s}
          in "tool_use" | "server_tool_use" => type
            call = {type: "tool_call", id: block[:id], name: block[:name], arguments: block[:input]}
            # Only the `tool_use` of a toolset member has the name, and a `nil` one is left out.
            toolset_name = block[:toolset_name] if type == "tool_use"
            toolset_name.is_a?(String) ? {**call, anthropic_toolset_name: toolset_name} : call
          in "mcp_tool_use"
            {
              type: "tool_call",
              id: block[:id],
              name: block[:name],
              arguments: block[:input],
              anthropic_mcp_server_name: block[:server_name]
            }
          in "tool_result"
            {
              type: "tool_call_response",
              id: block[:tool_use_id],
              response: tool_result_blocks(block[:content])
            }
          in /_tool_result\z/
            {
              type: "tool_call_response",
              id: block[:tool_use_id],
              response: result_block_content(block[:content])
            }
          in type
            {type: "anthropic_#{type}"}
          end
        end

        # @param messages [Array<Object>, nil]
        #
        # @return [Array<Hash{Symbol=>Object}>]
        def messages(messages)
          Array(messages).map { {role: _1[:role].to_s, parts: parts(_1[:content])} }
        end

        # Sets each value as one JSON string, and `stop_sequences` as it is. When they total more than
        # `limit`, content is removed, and the span gets `anthropic.content.truncated`.
        # First, `stop_sequences`, or the `gen_ai.tool.call.arguments` of a tool's span, is left out
        # whole when it is over `limit` by itself.
        # Then message parts are removed whole ({truncate_parts}): those of
        # `gen_ai.system_instructions`, then of each input message, oldest first, then of each output
        # message. On a tool's span, `anthropic.tool_result.content` loses content blocks instead, the
        # last one first.
        # Emptied lists stay, so what is left can still be over a small `limit`.
        #
        # @param span [OpenTelemetry::Trace::Span]
        # @param input [Array<Hash{Symbol=>Object}>, nil] the value of `gen_ai.input.messages`
        # @param others [Hash{String=>Object, nil}] the other attributes, by name
        # @param stop_sequences [Array<String>, nil] the value of `gen_ai.request.stop_sequences`
        # @param limit [Integer] the most bytes the values hold
        def set_content_attributes(span, input, others, stop_sequences: nil, limit: CONTENT_LIMIT)
          values = {**others, GEN_AI_INPUT_MESSAGES => input}.compact
          jsons = values.transform_values { JSON.generate(_1) }
          stop_sequences = nil if stop_sequences&.empty?
          stop_bytes = stop_sequences.to_a.sum(&:bytesize)
          reduced = false
          if stop_bytes > limit
            stop_sequences = nil
            stop_bytes = 0
            reduced = true
          end
          if jsons[GEN_AI_TOOL_CALL_ARGUMENTS].to_s.bytesize > limit
            jsons.delete(GEN_AI_TOOL_CALL_ARGUMENTS)
            reduced = true
          end
          excess = jsons.sum { _2.bytesize } + stop_bytes - limit
          blocks = others[ANTHROPIC_TOOL_RESULT_CONTENT]
          if excess.positive? && blocks&.any?
            jsons[ANTHROPIC_TOOL_RESULT_CONTENT] = JSON.generate(blocks.first(kept_items(blocks, excess)))
            reduced = true
          elsif excess.positive?
            fitted = values.slice(GEN_AI_SYSTEM_INSTRUCTIONS).transform_values(&:dup)
            [GEN_AI_INPUT_MESSAGES, GEN_AI_OUTPUT_MESSAGES].each do |name|
              fitted[name] = values[name].map { {**_1, parts: _1[:parts].dup} } if values.key?(name)
            end
            lists = fitted.flat_map do |name, value|
              name == GEN_AI_SYSTEM_INSTRUCTIONS ? [value] : value.map { _1[:parts] }
            end
            if truncate_parts(lists, excess)
              fitted.each { jsons[_1] = JSON.generate(_2) }
              reduced = true
            end
          end
          jsons.each { span.set_attribute(_1, _2) }
          span.set_attribute(GEN_AI_REQUEST_STOP_SEQUENCES, stop_sequences) unless stop_sequences.nil?
          # Absent, never `false`, on a span that keeps all of its content.
          span.set_attribute(ANTHROPIC_CONTENT_TRUNCATED, true) if reduced
        end

        # Removes parts from `lists`, in place, from the first on, until `excess` fewer bytes of JSON
        # remain. The last part left, when it is a `text` part, loses the end of its `content` instead.
        #
        # @param lists [Array<Array<Hash{Symbol=>Object}>>] every list of parts of a span, in the
        #   order in which they lose parts
        # @param excess [Integer] how far the span's `content` attributes are over the limit
        #
        # @return [Boolean] whether a part was removed or cut
        def truncate_parts(lists, excess)
          left = lists.sum(&:length)
          reduced = false
          lists.each do |parts|
            while excess.positive? && parts.any?
              part = parts.first
              if left == 1 && part[:type] == "text"
                text = text_within(part[:content], excess)
                parts[0] = {**part, content: text}
                return reduced || text != part[:content]
              end

              parts.shift
              left -= 1
              reduced = true
              # A part that is not the last of its list goes with the comma after it.
              excess -= JSON.generate(part).bytesize + (parts.empty? ? 0 : 1)
            end
          end
          reduced
        end

        private

        # How many of `items` stay once items are removed from the end until `excess` fewer bytes of
        # JSON remain.
        #
        # @param items [Array<Object>]
        # @param excess [Integer]
        #
        # @return [Integer]
        def kept_items(items, excess)
          keep = items.length
          while keep.positive? && excess.positive?
            keep -= 1
            # An item that is not the first goes with the comma before it.
            excess -= JSON.generate(items[keep]).bytesize + (keep.zero? ? 0 : 1)
          end
          keep
        end

        # @param content [String, Array<Object>, nil] with Symbol keys
        #
        # @return [Array<Object>]
        def tool_result_blocks(content)
          return [] if content.nil?
          return [{type: "text", text: content}] if content.is_a?(String)

          content.map do
            type = block_type(_1)
            %w[text search_result].include?(type) ? result_value(_1) : {type: type}
          end
        end

        # The longest start of `text` whose JSON is at least `excess` bytes shorter. The cut is made
        # in the JSON, where the bytes are counted, and ends between two characters.
        #
        # @param text [String]
        # @param excess [Integer]
        #
        # @return [String]
        def text_within(text, excess)
          json = JSON.generate(text)
          length = json.bytesize - 2 - excess
          return "" unless length.positive?

          # A byte of the form 10xxxxxx is inside a character.
          length -= 1 while json.getbyte(length + 1) & 0xC0 == 0x80
          kept = json.byteslice(1, length)
          slash = kept.byterindex("\\")
          if slash && slash > kept.bytesize - 6
            first = slash
            first -= 1 while first.positive? && kept.getbyte(first - 1) == "\\".ord
            # The last of an odd number of backslashes starts an escape: `\u` and four digits, or
            # one character.
            escape = kept.getbyte(slash + 1) == "u".ord ? 6 : 2
            kept = kept.byteslice(0, slash) if (slash - first).even? && slash + escape > kept.bytesize
          end
          JSON.parse(%("#{kept}"))
        end
      end
    end
  end
end
