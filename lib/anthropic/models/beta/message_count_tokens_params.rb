# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Messages#count_tokens
      class MessageCountTokensParams < Anthropic::Internal::Type::BaseModel
        # @!parse
        #   extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute messages
        #   Input messages.
        #
        #   Our models are trained to operate on alternating `user` and `assistant`
        #   conversational turns. When creating a new `Message`, you specify the prior
        #   conversational turns with the `messages` parameter, and the model then generates
        #   the next `Message` in the conversation. Consecutive `user` or `assistant` turns
        #   in your request will be combined into a single turn.
        #
        #   Each input message must be an object with a `role` and `content`. You can
        #   specify a single `user`-role message, or you can include multiple `user` and
        #   `assistant` messages.
        #
        #   If the final message uses the `assistant` role, the response content will
        #   continue immediately from the content in that message. This can be used to
        #   constrain part of the model's response.
        #
        #   Example with a single `user` message:
        #
        #   ```json
        #   [{ "role": "user", "content": "Hello, Claude" }]
        #   ```
        #
        #   Example with multiple conversational turns:
        #
        #   ```json
        #   [
        #     { "role": "user", "content": "Hello there." },
        #     { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
        #     { "role": "user", "content": "Can you explain LLMs in plain English?" }
        #   ]
        #   ```
        #
        #   Example with a partially-filled response from Claude:
        #
        #   ```json
        #   [
        #     {
        #       "role": "user",
        #       "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
        #     },
        #     { "role": "assistant", "content": "The best answer is (" }
        #   ]
        #   ```
        #
        #   Each input message `content` may be either a single `string` or an array of
        #   content blocks, where each block has a specific `type`. Using a `string` for
        #   `content` is shorthand for an array of one content block of type `"text"`. The
        #   following input messages are equivalent:
        #
        #   ```json
        #   { "role": "user", "content": "Hello, Claude" }
        #   ```
        #
        #   ```json
        #   { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
        #   ```
        #
        #   Starting with Claude 3 models, you can also send image content blocks:
        #
        #   ```json
        #   {
        #     "role": "user",
        #     "content": [
        #       {
        #         "type": "image",
        #         "source": {
        #           "type": "base64",
        #           "media_type": "image/jpeg",
        #           "data": "/9j/4AAQSkZJRg..."
        #         }
        #       },
        #       { "type": "text", "text": "What is in this image?" }
        #     ]
        #   }
        #   ```
        #
        #   We currently support the `base64` source type for images, and the `image/jpeg`,
        #   `image/png`, `image/gif`, and `image/webp` media types.
        #
        #   See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for
        #   more input examples.
        #
        #   Note that if you want to include a
        #   [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
        #   the top-level `system` parameter — there is no `"system"` role for input
        #   messages in the Messages API.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaMessageParam>]
        required :messages, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Models::Beta::BetaMessageParam] }

        # @!attribute model
        #   The model that will complete your prompt.\n\nSee
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        #
        #   @return [Symbol, String, Anthropic::Models::Model]
        required :model, union: -> { Anthropic::Models::Model }

        # @!attribute [r] system_
        #   System prompt.
        #
        #   A system prompt is a way of providing context and instructions to Claude, such
        #   as specifying a particular goal or role. See our
        #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>, nil]
        optional :system_,
                 union: -> { Anthropic::Models::Beta::MessageCountTokensParams::System },
                 api_name: :system

        # @!parse
        #   # @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>]
        #   attr_writer :system_

        # @!attribute [r] thinking
        #   Configuration for enabling Claude's extended thinking.
        #
        #   When enabled, responses include `thinking` content blocks showing Claude's
        #   thinking process before the final answer. Requires a minimum budget of 1,024
        #   tokens and counts towards your `max_tokens` limit.
        #
        #   See
        #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
        #   for details.
        #
        #   @return [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, nil]
        optional :thinking, union: -> { Anthropic::Models::Beta::BetaThinkingConfigParam }

        # @!parse
        #   # @return [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled]
        #   attr_writer :thinking

        # @!attribute [r] tool_choice
        #   How the model should use the provided tools. The model can use a specific tool,
        #   any available tool, decide by itself, or not use tools at all.
        #
        #   @return [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone, nil]
        optional :tool_choice, union: -> { Anthropic::Models::Beta::BetaToolChoice }

        # @!parse
        #   # @return [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone]
        #   attr_writer :tool_choice

        # @!attribute [r] tools
        #   Definitions of tools that the model may use.
        #
        #   If you include `tools` in your API request, the model may return `tool_use`
        #   content blocks that represent the model's use of those tools. You can then run
        #   those tools using the tool input generated by the model and then optionally
        #   return results back to the model using `tool_result` content blocks.
        #
        #   Each tool definition includes:
        #
        #   - `name`: Name of the tool.
        #   - `description`: Optional, but strongly-recommended description of the tool.
        #   - `input_schema`: [JSON schema](https://json-schema.org/draft/2020-12) for the
        #     tool `input` shape that the model will produce in `tool_use` output content
        #     blocks.
        #
        #   For example, if you defined `tools` as:
        #
        #   ```json
        #   [
        #     {
        #       "name": "get_stock_price",
        #       "description": "Get the current stock price for a given ticker symbol.",
        #       "input_schema": {
        #         "type": "object",
        #         "properties": {
        #           "ticker": {
        #             "type": "string",
        #             "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
        #           }
        #         },
        #         "required": ["ticker"]
        #       }
        #     }
        #   ]
        #   ```
        #
        #   And then asked the model "What's the S&P 500 at today?", the model might produce
        #   `tool_use` content blocks in the response like this:
        #
        #   ```json
        #   [
        #     {
        #       "type": "tool_use",
        #       "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #       "name": "get_stock_price",
        #       "input": { "ticker": "^GSPC" }
        #     }
        #   ]
        #   ```
        #
        #   You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
        #   input, and return the following back to the model in a subsequent `user`
        #   message:
        #
        #   ```json
        #   [
        #     {
        #       "type": "tool_result",
        #       "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #       "content": "259.75 USD"
        #     }
        #   ]
        #   ```
        #
        #   Tools can be used for workflows that include running client-side tools and
        #   functions, or more generally whenever you want the model to produce a particular
        #   JSON structure of output.
        #
        #   See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124>, nil]
        optional :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Models::Beta::MessageCountTokensParams::Tool] }

        # @!parse
        #   # @return [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124>]
        #   attr_writer :tools

        # @!attribute [r] betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Models::AnthropicBeta] },
                 api_name: :"anthropic-beta"

        # @!parse
        #   # @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
        #   attr_writer :betas

        # @!parse
        #   # @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>]
        #   # @param model [Symbol, String, Anthropic::Models::Model]
        #   # @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>]
        #   # @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled]
        #   # @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone]
        #   # @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124>]
        #   # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
        #   # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(
        #     messages:,
        #     model:,
        #     system_: nil,
        #     thinking: nil,
        #     tool_choice: nil,
        #     tools: nil,
        #     betas: nil,
        #     request_options: {},
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void

        # System prompt.
        #
        # A system prompt is a way of providing context and instructions to Claude, such
        # as specifying a particular goal or role. See our
        # [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        module System
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::MessageCountTokensParams::System::BetaTextBlockParamArray }

          # @!parse
          #   # @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam>)]
          #   def self.variants; end

          BetaTextBlockParamArray =
            Anthropic::Internal::Type::ArrayOf[-> { Anthropic::Models::Beta::BetaTextBlockParam }]
        end

        module Tool
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Models::Beta::BetaTool }

          variant -> { Anthropic::Models::Beta::BetaToolComputerUse20241022 }

          variant -> { Anthropic::Models::Beta::BetaToolBash20241022 }

          variant -> { Anthropic::Models::Beta::BetaToolTextEditor20241022 }

          variant -> { Anthropic::Models::Beta::BetaToolComputerUse20250124 }

          variant -> { Anthropic::Models::Beta::BetaToolBash20250124 }

          variant -> { Anthropic::Models::Beta::BetaToolTextEditor20250124 }

          # @!parse
          #   # @return [Array(Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124)]
          #   def self.variants; end
        end
      end
    end
  end
end
