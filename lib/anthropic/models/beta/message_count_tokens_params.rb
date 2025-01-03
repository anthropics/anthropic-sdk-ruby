# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class MessageCountTokensParams < Anthropic::BaseModel
        # @!attribute messages
        #   Input messages.
        #
        # Our models are trained to operate on alternating `user` and `assistant` conversational turns. When creating a new `Message`, you specify the prior conversational turns with the `messages` parameter, and the model then generates the next `Message` in the conversation. Consecutive `user` or `assistant` turns in your request will be combined into a single turn.
        #
        # Each input message must be an object with a `role` and `content`. You can specify a single `user`-role message, or you can include multiple `user` and `assistant` messages.
        #
        # If the final message uses the `assistant` role, the response content will continue immediately from the content in that message. This can be used to constrain part of the model's response.
        #
        # Example with a single `user` message:
        #
        # ```json
        # [{"role": "user", "content": "Hello, Claude"}]
        # ```
        #
        # Example with multiple conversational turns:
        #
        # ```json
        # [
        #   {"role": "user", "content": "Hello there."},
        #   {"role": "assistant", "content": "Hi, I'm Claude. How can I help you?"},
        #   {"role": "user", "content": "Can you explain LLMs in plain English?"},
        # ]
        # ```
        #
        # Example with a partially-filled response from Claude:
        #
        # ```json
        # [
        #   {"role": "user", "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"},
        #   {"role": "assistant", "content": "The best answer is ("},
        # ]
        # ```
        #
        # Each input message `content` may be either a single `string` or an array of content blocks, where each block has a specific `type`. Using a `string` for `content` is shorthand for an array of one content block of type `"text"`. The following input messages are equivalent:
        #
        # ```json
        # {"role": "user", "content": "Hello, Claude"}
        # ```
        #
        # ```json
        # {"role": "user", "content": [{"type": "text", "text": "Hello, Claude"}]}
        # ```
        #
        # Starting with Claude 3 models, you can also send image content blocks:
        #
        # ```json
        # {"role": "user", "content": [
        #   {
        #     "type": "image",
        #     "source": {
        #       "type": "base64",
        #       "media_type": "image/jpeg",
        #       "data": "/9j/4AAQSkZJRg...",
        #     }
        #   },
        #   {"type": "text", "text": "What is in this image?"}
        # ]}
        # ```
        #
        # We currently support the `base64` source type for images, and the `image/jpeg`, `image/png`, `image/gif`, and `image/webp` media types.
        #
        # See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for more input examples.
        #
        # Note that if you want to include a [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use the top-level `system` parameter — there is no `"system"` role for input messages in the Messages API.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaMessageParam>]
        required :messages, Anthropic::ArrayOf[-> { Anthropic::Models::Beta::BetaMessageParam }]

        # @!attribute model
        #   The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
        #
        #   @return [String, Symbol, Anthropic::Models::Model::UnionMember1]
        required :model, union: -> { Anthropic::Models::Model }

        # @!attribute system_
        #   System prompt.
        #
        # A system prompt is a way of providing context and instructions to Claude, such as specifying a particular goal or role. See our [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>]
        optional :system_,
                 union: -> { Anthropic::Models::Beta::MessageCountTokensParams::System },
                 api_name: :system

        # @!attribute tool_choice
        #   How the model should use the provided tools. The model can use a specific tool, any available tool, or decide by itself.
        #
        #   @return [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool]
        optional :tool_choice, union: -> { Anthropic::Models::Beta::BetaToolChoice }

        # @!attribute tools
        #   Definitions of tools that the model may use.
        #
        # If you include `tools` in your API request, the model may return `tool_use` content blocks that represent the model's use of those tools. You can then run those tools using the tool input generated by the model and then optionally return results back to the model using `tool_result` content blocks.
        #
        # Each tool definition includes:
        #
        # * `name`: Name of the tool.
        # * `description`: Optional, but strongly-recommended description of the tool.
        # * `input_schema`: [JSON schema](https://json-schema.org/) for the tool `input` shape that the model will produce in `tool_use` output content blocks.
        #
        # For example, if you defined `tools` as:
        #
        # ```json
        # [
        #   {
        #     "name": "get_stock_price",
        #     "description": "Get the current stock price for a given ticker symbol.",
        #     "input_schema": {
        #       "type": "object",
        #       "properties": {
        #         "ticker": {
        #           "type": "string",
        #           "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
        #         }
        #       },
        #       "required": ["ticker"]
        #     }
        #   }
        # ]
        # ```
        #
        # And then asked the model "What's the S&P 500 at today?", the model might produce `tool_use` content blocks in the response like this:
        #
        # ```json
        # [
        #   {
        #     "type": "tool_use",
        #     "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #     "name": "get_stock_price",
        #     "input": { "ticker": "^GSPC" }
        #   }
        # ]
        # ```
        #
        # You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an input, and return the following back to the model in a subsequent `user` message:
        #
        # ```json
        # [
        #   {
        #     "type": "tool_result",
        #     "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #     "content": "259.75 USD"
        #   }
        # ]
        # ```
        #
        # Tools can be used for workflows that include running client-side tools and functions, or more generally whenever you want the model to produce a particular JSON structure of output.
        #
        # See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022>]
        optional :tools,
                 Anthropic::ArrayOf[union: -> {
                   Anthropic::Models::Beta::MessageCountTokensParams::Tool
                 }]

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>]
        optional :betas,
                 Anthropic::ArrayOf[union: -> { Anthropic::Models::AnthropicBeta }],
                 api_name: :"anthropic-beta"

        # @!parse
        #   # @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>] Input messages.
        #   #
        #   #   Our models are trained to operate on alternating `user` and `assistant`
        #   #   conversational turns. When creating a new `Message`, you specify the prior
        #   #   conversational turns with the `messages` parameter, and the model then generates
        #   #   the next `Message` in the conversation. Consecutive `user` or `assistant` turns
        #   #   in your request will be combined into a single turn.
        #   #
        #   #   Each input message must be an object with a `role` and `content`. You can
        #   #   specify a single `user`-role message, or you can include multiple `user` and
        #   #   `assistant` messages.
        #   #
        #   #   If the final message uses the `assistant` role, the response content will
        #   #   continue immediately from the content in that message. This can be used to
        #   #   constrain part of the model's response.
        #   #
        #   #   Example with a single `user` message:
        #   #
        #   #   ```json
        #   #   [{ "role": "user", "content": "Hello, Claude" }]
        #   #   ```
        #   #
        #   #   Example with multiple conversational turns:
        #   #
        #   #   ```json
        #   #   [
        #   #     { "role": "user", "content": "Hello there." },
        #   #     { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
        #   #     { "role": "user", "content": "Can you explain LLMs in plain English?" }
        #   #   ]
        #   #   ```
        #   #
        #   #   Example with a partially-filled response from Claude:
        #   #
        #   #   ```json
        #   #   [
        #   #     {
        #   #       "role": "user",
        #   #       "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
        #   #     },
        #   #     { "role": "assistant", "content": "The best answer is (" }
        #   #   ]
        #   #   ```
        #   #
        #   #   Each input message `content` may be either a single `string` or an array of
        #   #   content blocks, where each block has a specific `type`. Using a `string` for
        #   #   `content` is shorthand for an array of one content block of type `"text"`. The
        #   #   following input messages are equivalent:
        #   #
        #   #   ```json
        #   #   { "role": "user", "content": "Hello, Claude" }
        #   #   ```
        #   #
        #   #   ```json
        #   #   { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
        #   #   ```
        #   #
        #   #   Starting with Claude 3 models, you can also send image content blocks:
        #   #
        #   #   ```json
        #   #   {
        #   #     "role": "user",
        #   #     "content": [
        #   #       {
        #   #         "type": "image",
        #   #         "source": {
        #   #           "type": "base64",
        #   #           "media_type": "image/jpeg",
        #   #           "data": "/9j/4AAQSkZJRg..."
        #   #         }
        #   #       },
        #   #       { "type": "text", "text": "What is in this image?" }
        #   #     ]
        #   #   }
        #   #   ```
        #   #
        #   #   We currently support the `base64` source type for images, and the `image/jpeg`,
        #   #   `image/png`, `image/gif`, and `image/webp` media types.
        #   #
        #   #   See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for
        #   #   more input examples.
        #   #
        #   #   Note that if you want to include a
        #   #   [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
        #   #   the top-level `system` parameter — there is no `"system"` role for input
        #   #   messages in the Messages API.
        #   #
        #   # @param model [String] The model that will complete your prompt.\n\nSee
        #   #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   #   details and options.
        #   #
        #   # @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>] System prompt.
        #   #
        #   #   A system prompt is a way of providing context and instructions to Claude, such
        #   #   as specifying a particular goal or role. See our
        #   #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        #   #
        #   # @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool] How the model should use the provided tools. The model can use a specific tool,
        #   #   any available tool, or decide by itself.
        #   #
        #   # @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022>] Definitions of tools that the model may use.
        #   #
        #   #   If you include `tools` in your API request, the model may return `tool_use`
        #   #   content blocks that represent the model's use of those tools. You can then run
        #   #   those tools using the tool input generated by the model and then optionally
        #   #   return results back to the model using `tool_result` content blocks.
        #   #
        #   #   Each tool definition includes:
        #   #
        #   #   - `name`: Name of the tool.
        #   #   - `description`: Optional, but strongly-recommended description of the tool.
        #   #   - `input_schema`: [JSON schema](https://json-schema.org/) for the tool `input`
        #   #     shape that the model will produce in `tool_use` output content blocks.
        #   #
        #   #   For example, if you defined `tools` as:
        #   #
        #   #   ```json
        #   #   [
        #   #     {
        #   #       "name": "get_stock_price",
        #   #       "description": "Get the current stock price for a given ticker symbol.",
        #   #       "input_schema": {
        #   #         "type": "object",
        #   #         "properties": {
        #   #           "ticker": {
        #   #             "type": "string",
        #   #             "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
        #   #           }
        #   #         },
        #   #         "required": ["ticker"]
        #   #       }
        #   #     }
        #   #   ]
        #   #   ```
        #   #
        #   #   And then asked the model "What's the S&P 500 at today?", the model might produce
        #   #   `tool_use` content blocks in the response like this:
        #   #
        #   #   ```json
        #   #   [
        #   #     {
        #   #       "type": "tool_use",
        #   #       "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #   #       "name": "get_stock_price",
        #   #       "input": { "ticker": "^GSPC" }
        #   #     }
        #   #   ]
        #   #   ```
        #   #
        #   #   You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
        #   #   input, and return the following back to the model in a subsequent `user`
        #   #   message:
        #   #
        #   #   ```json
        #   #   [
        #   #     {
        #   #       "type": "tool_result",
        #   #       "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #   #       "content": "259.75 USD"
        #   #     }
        #   #   ]
        #   #   ```
        #   #
        #   #   Tools can be used for workflows that include running client-side tools and
        #   #   functions, or more generally whenever you want the model to produce a particular
        #   #   JSON structure of output.
        #   #
        #   #   See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
        #   #
        #   # @param betas [Array<String>] Optional header to specify the beta version(s) you want to use.
        #   #
        #   def initialize(messages:, model:, system_: nil, tool_choice: nil, tools: nil, betas: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # System prompt.
        #
        # A system prompt is a way of providing context and instructions to Claude, such as specifying a particular goal or role. See our [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        #
        # @example
        #
        # ```ruby
        # case union
        # in String
        #   # ...
        # in Anthropic::Models::Beta::MessageCountTokensParams::System::BetaTextBlockParamArray
        #   # ...
        # end
        # ```
        class System < Anthropic::Union
          BetaTextBlockParamArray = Anthropic::ArrayOf[-> { Anthropic::Models::Beta::BetaTextBlockParam }]

          variant String

          variant -> { Anthropic::Models::Beta::MessageCountTokensParams::System::BetaTextBlockParamArray }
        end

        # @example
        #
        # ```ruby
        # case union
        # in Anthropic::Models::Beta::BetaTool
        #   # ...
        # in Anthropic::Models::Beta::BetaToolComputerUse20241022
        #   # ...
        # in Anthropic::Models::Beta::BetaToolBash20241022
        #   # ...
        # in Anthropic::Models::Beta::BetaToolTextEditor20241022
        #   # ...
        # end
        # ```
        class Tool < Anthropic::Union
          variant -> { Anthropic::Models::Beta::BetaTool }

          variant -> { Anthropic::Models::Beta::BetaToolComputerUse20241022 }

          variant -> { Anthropic::Models::Beta::BetaToolBash20241022 }

          variant -> { Anthropic::Models::Beta::BetaToolTextEditor20241022 }
        end

        class BetaTool < Anthropic::BaseModel
          # @!attribute input_schema
          #   [JSON schema](https://json-schema.org/) for this tool's input.
          #
          # This defines the shape of the `input` that your tool accepts and that the model will produce.
          #
          #   @return [Anthropic::Models::Beta::BetaTool::InputSchema]
          required :input_schema, -> { Anthropic::Models::Beta::BetaTool::InputSchema }

          # @!attribute name
          #   Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          #
          #   @return [String]
          required :name, String

          # @!attribute cache_control
          #
          #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
          optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

          # @!attribute description
          #   Description of what this tool does.
          #
          # Tool descriptions should be as detailed as possible. The more information that the model has about what the tool is and how to use it, the better it will perform. You can use natural language descriptions to reinforce important aspects of the tool input JSON schema.
          #
          #   @return [String]
          optional :description, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaTool::Type, nil]
          optional :type, enum: -> { Anthropic::Models::Beta::BetaTool::Type }

          # @!parse
          #   # @param input_schema [Anthropic::Models::Beta::BetaTool::InputSchema] [JSON schema](https://json-schema.org/) for this tool's input.
          #   #
          #   #   This defines the shape of the `input` that your tool accepts and that the model
          #   #   will produce.
          #   #
          #   # @param name [String] Name of the tool.
          #   #
          #   #   This is how the tool will be called by the model and in tool_use blocks.
          #   #
          #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
          #   #
          #   # @param description [String] Description of what this tool does.
          #   #
          #   #   Tool descriptions should be as detailed as possible. The more information that
          #   #   the model has about what the tool is and how to use it, the better it will
          #   #   perform. You can use natural language descriptions to reinforce important
          #   #   aspects of the tool input JSON schema.
          #   #
          #   # @param type [String, nil]
          #   #
          #   def initialize(input_schema:, name:, cache_control: nil, description: nil, type: nil, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          class InputSchema < Anthropic::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, Anthropic::Models::Beta::BetaTool::InputSchema::Type]
            required :type, enum: -> { Anthropic::Models::Beta::BetaTool::InputSchema::Type }

            # @!attribute properties
            #
            #   @return [Object, nil]
            optional :properties, Anthropic::Unknown

            # @!parse
            #   # [JSON schema](https://json-schema.org/) for this tool's input.
            #   #
            #   #   This defines the shape of the `input` that your tool accepts and that the model
            #   #   will produce.
            #   #
            #   # @param type [String]
            #   # @param properties [Object, nil]
            #   #
            #   def initialize(type:, properties: nil, **) = super

            # def initialize: (Hash | Anthropic::BaseModel) -> void

            # @example
            #
            # ```ruby
            # case enum
            # in :object
            #   # ...
            # end
            # ```
            class Type < Anthropic::Enum
              OBJECT = :object

              finalize!
            end
          end

          # @example
          #
          # ```ruby
          # case enum
          # in :custom
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            CUSTOM = :custom

            finalize!
          end
        end

        class BetaToolComputerUse20241022 < Anthropic::BaseModel
          # @!attribute display_height_px
          #   The height of the display in pixels.
          #
          #   @return [Integer]
          required :display_height_px, Integer

          # @!attribute display_width_px
          #   The width of the display in pixels.
          #
          #   @return [Integer]
          required :display_width_px, Integer

          # @!attribute name
          #   Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaToolComputerUse20241022::Name]
          required :name, enum: -> { Anthropic::Models::Beta::BetaToolComputerUse20241022::Name }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaToolComputerUse20241022::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaToolComputerUse20241022::Type }

          # @!attribute cache_control
          #
          #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
          optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

          # @!attribute display_number
          #   The X11 display number (e.g. 0, 1) for the display.
          #
          #   @return [Integer, nil]
          optional :display_number, Integer

          # @!parse
          #   # @param display_height_px [Integer] The height of the display in pixels.
          #   #
          #   # @param display_width_px [Integer] The width of the display in pixels.
          #   #
          #   # @param name [String] Name of the tool.
          #   #
          #   #   This is how the tool will be called by the model and in tool_use blocks.
          #   #
          #   # @param type [String]
          #   #
          #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
          #   #
          #   # @param display_number [Integer, nil] The X11 display number (e.g. 0, 1) for the display.
          #   #
          #   def initialize(display_height_px:, display_width_px:, name:, type:, cache_control: nil, display_number: nil, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          #
          # @example
          #
          # ```ruby
          # case enum
          # in :computer
          #   # ...
          # end
          # ```
          class Name < Anthropic::Enum
            COMPUTER = :computer

            finalize!
          end

          # @example
          #
          # ```ruby
          # case enum
          # in :computer_20241022
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            COMPUTER_20241022 = :computer_20241022

            finalize!
          end
        end

        class BetaToolBash20241022 < Anthropic::BaseModel
          # @!attribute name
          #   Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaToolBash20241022::Name]
          required :name, enum: -> { Anthropic::Models::Beta::BetaToolBash20241022::Name }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaToolBash20241022::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaToolBash20241022::Type }

          # @!attribute cache_control
          #
          #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
          optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

          # @!parse
          #   # @param name [String] Name of the tool.
          #   #
          #   #   This is how the tool will be called by the model and in tool_use blocks.
          #   #
          #   # @param type [String]
          #   #
          #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
          #   #
          #   def initialize(name:, type:, cache_control: nil, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          #
          # @example
          #
          # ```ruby
          # case enum
          # in :bash
          #   # ...
          # end
          # ```
          class Name < Anthropic::Enum
            BASH = :bash

            finalize!
          end

          # @example
          #
          # ```ruby
          # case enum
          # in :bash_20241022
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            BASH_20241022 = :bash_20241022

            finalize!
          end
        end

        class BetaToolTextEditor20241022 < Anthropic::BaseModel
          # @!attribute name
          #   Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaToolTextEditor20241022::Name]
          required :name, enum: -> { Anthropic::Models::Beta::BetaToolTextEditor20241022::Name }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaToolTextEditor20241022::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaToolTextEditor20241022::Type }

          # @!attribute cache_control
          #
          #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
          optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

          # @!parse
          #   # @param name [String] Name of the tool.
          #   #
          #   #   This is how the tool will be called by the model and in tool_use blocks.
          #   #
          #   # @param type [String]
          #   #
          #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
          #   #
          #   def initialize(name:, type:, cache_control: nil, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # Name of the tool.
          #
          # This is how the tool will be called by the model and in tool_use blocks.
          #
          # @example
          #
          # ```ruby
          # case enum
          # in :str_replace_editor
          #   # ...
          # end
          # ```
          class Name < Anthropic::Enum
            STR_REPLACE_EDITOR = :str_replace_editor

            finalize!
          end

          # @example
          #
          # ```ruby
          # case enum
          # in :text_editor_20241022
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            TEXT_EDITOR_20241022 = :text_editor_20241022

            finalize!
          end
        end
      end
    end
  end
end
