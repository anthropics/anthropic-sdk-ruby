# typed: strong

module Anthropic
  module Models
    module Beta
      class MessageCountTokensParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::MessageCountTokensParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Input messages.
        #
        # Our models are trained to operate on alternating `user` and `assistant`
        # conversational turns. When creating a new `Message`, you specify the prior
        # conversational turns with the `messages` parameter, and the model then generates
        # the next `Message` in the conversation. Consecutive `user` or `assistant` turns
        # in your request will be combined into a single turn.
        #
        # Each input message must be an object with a `role` and `content`. You can
        # specify a single `user`-role message, or you can include multiple `user` and
        # `assistant` messages.
        #
        # If the final message uses the `assistant` role, the response content will
        # continue immediately from the content in that message. This can be used to
        # constrain part of the model's response.
        #
        # Example with a single `user` message:
        #
        # ```json
        # [{ "role": "user", "content": "Hello, Claude" }]
        # ```
        #
        # Example with multiple conversational turns:
        #
        # ```json
        # [
        #   { "role": "user", "content": "Hello there." },
        #   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
        #   { "role": "user", "content": "Can you explain LLMs in plain English?" }
        # ]
        # ```
        #
        # Example with a partially-filled response from Claude:
        #
        # ```json
        # [
        #   {
        #     "role": "user",
        #     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
        #   },
        #   { "role": "assistant", "content": "The best answer is (" }
        # ]
        # ```
        #
        # Each input message `content` may be either a single `string` or an array of
        # content blocks, where each block has a specific `type`. Using a `string` for
        # `content` is shorthand for an array of one content block of type `"text"`. The
        # following input messages are equivalent:
        #
        # ```json
        # { "role": "user", "content": "Hello, Claude" }
        # ```
        #
        # ```json
        # { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
        # ```
        #
        # See [input examples](https://docs.claude.com/en/api/messages-examples).
        #
        # Note that if you want to include a
        # [system prompt](https://docs.claude.com/en/docs/system-prompts), you can use the
        # top-level `system` parameter — there is no `"system"` role for input messages in
        # the Messages API.
        #
        # There is a limit of 100,000 messages in a single request.
        sig { returns(T::Array[Anthropic::Beta::BetaMessageParam]) }
        attr_accessor :messages

        # The model that will complete your prompt.\n\nSee
        # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        # details and options.
        sig { returns(T.any(Anthropic::Model::OrSymbol, String)) }
        attr_accessor :model

        # Context management configuration.
        #
        # This allows you to control how Claude manages context across multiple requests,
        # such as whether to clear function results or not.
        sig { returns(T.nilable(Anthropic::Beta::BetaContextManagementConfig)) }
        attr_reader :context_management

        sig do
          params(
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementConfig::OrHash)
          ).void
        end
        attr_writer :context_management

        # MCP servers to be utilized in this request
        sig do
          returns(
            T.nilable(
              T::Array[Anthropic::Beta::BetaRequestMCPServerURLDefinition]
            )
          )
        end
        attr_reader :mcp_servers

        sig do
          params(
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaRequestMCPServerURLDefinition::OrHash
              ]
          ).void
        end
        attr_writer :mcp_servers

        # Configuration options for the model's output, such as the output format.
        sig { returns(T.nilable(Anthropic::Beta::BetaOutputConfig)) }
        attr_reader :output_config

        sig do
          params(output_config: Anthropic::Beta::BetaOutputConfig::OrHash).void
        end
        attr_writer :output_config

        # Deprecated: Use `output_config.format` instead. See
        # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
        #
        # A schema to specify Claude's output format in responses. This parameter will be
        # removed in a future release.
        sig { returns(T.nilable(Anthropic::Beta::BetaJSONOutputFormat)) }
        attr_reader :output_format

        sig do
          params(
            output_format:
              T.nilable(Anthropic::Beta::BetaJSONOutputFormat::OrHash)
          ).void
        end
        attr_writer :output_format

        # System prompt.
        #
        # A system prompt is a way of providing context and instructions to Claude, such
        # as specifying a particular goal or role. See our
        # [guide to system prompts](https://docs.claude.com/en/docs/system-prompts).
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::MessageCountTokensParams::System::Variants
            )
          )
        end
        attr_reader :system_

        sig do
          params(
            system_: Anthropic::Beta::MessageCountTokensParams::System::Variants
          ).void
        end
        attr_writer :system_

        # Configuration for enabling Claude's extended thinking.
        #
        # When enabled, responses include `thinking` content blocks showing Claude's
        # thinking process before the final answer. Requires a minimum budget of 1,024
        # tokens and counts towards your `max_tokens` limit.
        #
        # See
        # [extended thinking](https://docs.claude.com/en/docs/build-with-claude/extended-thinking)
        # for details.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled,
                Anthropic::Beta::BetaThinkingConfigDisabled
              )
            )
          )
        end
        attr_reader :thinking

        sig do
          params(
            thinking:
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigDisabled::OrHash
              )
          ).void
        end
        attr_writer :thinking

        # How the model should use the provided tools. The model can use a specific tool,
        # any available tool, decide by itself, or not use tools at all.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaToolChoiceAuto,
                Anthropic::Beta::BetaToolChoiceAny,
                Anthropic::Beta::BetaToolChoiceTool,
                Anthropic::Beta::BetaToolChoiceNone
              )
            )
          )
        end
        attr_reader :tool_choice

        sig do
          params(
            tool_choice:
              T.any(
                Anthropic::Beta::BetaToolChoiceAuto::OrHash,
                Anthropic::Beta::BetaToolChoiceAny::OrHash,
                Anthropic::Beta::BetaToolChoiceTool::OrHash,
                Anthropic::Beta::BetaToolChoiceNone::OrHash
              )
          ).void
        end
        attr_writer :tool_choice

        # Definitions of tools that the model may use.
        #
        # If you include `tools` in your API request, the model may return `tool_use`
        # content blocks that represent the model's use of those tools. You can then run
        # those tools using the tool input generated by the model and then optionally
        # return results back to the model using `tool_result` content blocks.
        #
        # There are two types of tools: **client tools** and **server tools**. The
        # behavior described below applies to client tools. For
        # [server tools](https://docs.claude.com/en/docs/agents-and-tools/tool-use/overview#server-tools),
        # see their individual documentation as each has its own behavior (e.g., the
        # [web search tool](https://docs.claude.com/en/docs/agents-and-tools/tool-use/web-search-tool)).
        #
        # Each tool definition includes:
        #
        # - `name`: Name of the tool.
        # - `description`: Optional, but strongly-recommended description of the tool.
        # - `input_schema`: [JSON schema](https://json-schema.org/draft/2020-12) for the
        #   tool `input` shape that the model will produce in `tool_use` output content
        #   blocks.
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
        # And then asked the model "What's the S&P 500 at today?", the model might produce
        # `tool_use` content blocks in the response like this:
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
        # You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
        # input, and return the following back to the model in a subsequent `user`
        # message:
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
        # Tools can be used for workflows that include running client-side tools and
        # functions, or more generally whenever you want the model to produce a particular
        # JSON structure of output.
        #
        # See our [guide](https://docs.claude.com/en/docs/tool-use) for more details.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Beta::BetaTool,
                  Anthropic::Beta::BetaToolBash20241022,
                  Anthropic::Beta::BetaToolBash20250124,
                  Anthropic::Beta::BetaCodeExecutionTool20250522,
                  Anthropic::Beta::BetaCodeExecutionTool20250825,
                  Anthropic::Beta::BetaToolComputerUse20241022,
                  Anthropic::Beta::BetaMemoryTool20250818,
                  Anthropic::Beta::BetaToolComputerUse20250124,
                  Anthropic::Beta::BetaToolTextEditor20241022,
                  Anthropic::Beta::BetaToolComputerUse20251124,
                  Anthropic::Beta::BetaToolTextEditor20250124,
                  Anthropic::Beta::BetaToolTextEditor20250429,
                  Anthropic::Beta::BetaToolTextEditor20250728,
                  Anthropic::Beta::BetaWebSearchTool20250305,
                  Anthropic::Beta::BetaWebFetchTool20250910,
                  Anthropic::Beta::BetaToolSearchToolBm25_20251119,
                  Anthropic::Beta::BetaToolSearchToolRegex20251119,
                  Anthropic::Beta::BetaMCPToolset
                )
              ]
            )
          )
        end
        attr_reader :tools

        sig do
          params(
            tools:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaTool::OrHash,
                  Anthropic::Beta::BetaToolBash20241022::OrHash,
                  Anthropic::Beta::BetaToolBash20250124::OrHash,
                  Anthropic::Beta::BetaCodeExecutionTool20250522::OrHash,
                  Anthropic::Beta::BetaCodeExecutionTool20250825::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20241022::OrHash,
                  Anthropic::Beta::BetaMemoryTool20250818::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20241022::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20251124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250429::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250728::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20250305::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20250910::OrHash,
                  Anthropic::Beta::BetaToolSearchToolBm25_20251119::OrHash,
                  Anthropic::Beta::BetaToolSearchToolRegex20251119::OrHash,
                  Anthropic::Beta::BetaMCPToolset::OrHash
                )
              ]
          ).void
        end
        attr_writer :tools

        # Optional header to specify the beta version(s) you want to use.
        sig do
          returns(
            T.nilable(
              T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            )
          )
        end
        attr_reader :betas

        sig do
          params(
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
          ).void
        end
        attr_writer :betas

        sig do
          params(
            messages: T::Array[Anthropic::Beta::BetaMessageParam::OrHash],
            model: T.any(Anthropic::Model::OrSymbol, String),
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementConfig::OrHash),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaRequestMCPServerURLDefinition::OrHash
              ],
            output_config: Anthropic::Beta::BetaOutputConfig::OrHash,
            output_format:
              T.nilable(Anthropic::Beta::BetaJSONOutputFormat::OrHash),
            system_:
              Anthropic::Beta::MessageCountTokensParams::System::Variants,
            thinking:
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigDisabled::OrHash
              ),
            tool_choice:
              T.any(
                Anthropic::Beta::BetaToolChoiceAuto::OrHash,
                Anthropic::Beta::BetaToolChoiceAny::OrHash,
                Anthropic::Beta::BetaToolChoiceTool::OrHash,
                Anthropic::Beta::BetaToolChoiceNone::OrHash
              ),
            tools:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaTool::OrHash,
                  Anthropic::Beta::BetaToolBash20241022::OrHash,
                  Anthropic::Beta::BetaToolBash20250124::OrHash,
                  Anthropic::Beta::BetaCodeExecutionTool20250522::OrHash,
                  Anthropic::Beta::BetaCodeExecutionTool20250825::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20241022::OrHash,
                  Anthropic::Beta::BetaMemoryTool20250818::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20241022::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20251124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250429::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250728::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20250305::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20250910::OrHash,
                  Anthropic::Beta::BetaToolSearchToolBm25_20251119::OrHash,
                  Anthropic::Beta::BetaToolSearchToolRegex20251119::OrHash,
                  Anthropic::Beta::BetaMCPToolset::OrHash
                )
              ],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Input messages.
          #
          # Our models are trained to operate on alternating `user` and `assistant`
          # conversational turns. When creating a new `Message`, you specify the prior
          # conversational turns with the `messages` parameter, and the model then generates
          # the next `Message` in the conversation. Consecutive `user` or `assistant` turns
          # in your request will be combined into a single turn.
          #
          # Each input message must be an object with a `role` and `content`. You can
          # specify a single `user`-role message, or you can include multiple `user` and
          # `assistant` messages.
          #
          # If the final message uses the `assistant` role, the response content will
          # continue immediately from the content in that message. This can be used to
          # constrain part of the model's response.
          #
          # Example with a single `user` message:
          #
          # ```json
          # [{ "role": "user", "content": "Hello, Claude" }]
          # ```
          #
          # Example with multiple conversational turns:
          #
          # ```json
          # [
          #   { "role": "user", "content": "Hello there." },
          #   { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
          #   { "role": "user", "content": "Can you explain LLMs in plain English?" }
          # ]
          # ```
          #
          # Example with a partially-filled response from Claude:
          #
          # ```json
          # [
          #   {
          #     "role": "user",
          #     "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
          #   },
          #   { "role": "assistant", "content": "The best answer is (" }
          # ]
          # ```
          #
          # Each input message `content` may be either a single `string` or an array of
          # content blocks, where each block has a specific `type`. Using a `string` for
          # `content` is shorthand for an array of one content block of type `"text"`. The
          # following input messages are equivalent:
          #
          # ```json
          # { "role": "user", "content": "Hello, Claude" }
          # ```
          #
          # ```json
          # { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
          # ```
          #
          # See [input examples](https://docs.claude.com/en/api/messages-examples).
          #
          # Note that if you want to include a
          # [system prompt](https://docs.claude.com/en/docs/system-prompts), you can use the
          # top-level `system` parameter — there is no `"system"` role for input messages in
          # the Messages API.
          #
          # There is a limit of 100,000 messages in a single request.
          messages:,
          # The model that will complete your prompt.\n\nSee
          # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          model:,
          # Context management configuration.
          #
          # This allows you to control how Claude manages context across multiple requests,
          # such as whether to clear function results or not.
          context_management: nil,
          # MCP servers to be utilized in this request
          mcp_servers: nil,
          # Configuration options for the model's output, such as the output format.
          output_config: nil,
          # Deprecated: Use `output_config.format` instead. See
          # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
          #
          # A schema to specify Claude's output format in responses. This parameter will be
          # removed in a future release.
          output_format: nil,
          # System prompt.
          #
          # A system prompt is a way of providing context and instructions to Claude, such
          # as specifying a particular goal or role. See our
          # [guide to system prompts](https://docs.claude.com/en/docs/system-prompts).
          system_: nil,
          # Configuration for enabling Claude's extended thinking.
          #
          # When enabled, responses include `thinking` content blocks showing Claude's
          # thinking process before the final answer. Requires a minimum budget of 1,024
          # tokens and counts towards your `max_tokens` limit.
          #
          # See
          # [extended thinking](https://docs.claude.com/en/docs/build-with-claude/extended-thinking)
          # for details.
          thinking: nil,
          # How the model should use the provided tools. The model can use a specific tool,
          # any available tool, decide by itself, or not use tools at all.
          tool_choice: nil,
          # Definitions of tools that the model may use.
          #
          # If you include `tools` in your API request, the model may return `tool_use`
          # content blocks that represent the model's use of those tools. You can then run
          # those tools using the tool input generated by the model and then optionally
          # return results back to the model using `tool_result` content blocks.
          #
          # There are two types of tools: **client tools** and **server tools**. The
          # behavior described below applies to client tools. For
          # [server tools](https://docs.claude.com/en/docs/agents-and-tools/tool-use/overview#server-tools),
          # see their individual documentation as each has its own behavior (e.g., the
          # [web search tool](https://docs.claude.com/en/docs/agents-and-tools/tool-use/web-search-tool)).
          #
          # Each tool definition includes:
          #
          # - `name`: Name of the tool.
          # - `description`: Optional, but strongly-recommended description of the tool.
          # - `input_schema`: [JSON schema](https://json-schema.org/draft/2020-12) for the
          #   tool `input` shape that the model will produce in `tool_use` output content
          #   blocks.
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
          # And then asked the model "What's the S&P 500 at today?", the model might produce
          # `tool_use` content blocks in the response like this:
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
          # You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
          # input, and return the following back to the model in a subsequent `user`
          # message:
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
          # Tools can be used for workflows that include running client-side tools and
          # functions, or more generally whenever you want the model to produce a particular
          # JSON structure of output.
          #
          # See our [guide](https://docs.claude.com/en/docs/tool-use) for more details.
          tools: nil,
          # Optional header to specify the beta version(s) you want to use.
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              messages: T::Array[Anthropic::Beta::BetaMessageParam],
              model: T.any(Anthropic::Model::OrSymbol, String),
              context_management:
                T.nilable(Anthropic::Beta::BetaContextManagementConfig),
              mcp_servers:
                T::Array[Anthropic::Beta::BetaRequestMCPServerURLDefinition],
              output_config: Anthropic::Beta::BetaOutputConfig,
              output_format: T.nilable(Anthropic::Beta::BetaJSONOutputFormat),
              system_:
                Anthropic::Beta::MessageCountTokensParams::System::Variants,
              thinking:
                T.any(
                  Anthropic::Beta::BetaThinkingConfigEnabled,
                  Anthropic::Beta::BetaThinkingConfigDisabled
                ),
              tool_choice:
                T.any(
                  Anthropic::Beta::BetaToolChoiceAuto,
                  Anthropic::Beta::BetaToolChoiceAny,
                  Anthropic::Beta::BetaToolChoiceTool,
                  Anthropic::Beta::BetaToolChoiceNone
                ),
              tools:
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaTool,
                    Anthropic::Beta::BetaToolBash20241022,
                    Anthropic::Beta::BetaToolBash20250124,
                    Anthropic::Beta::BetaCodeExecutionTool20250522,
                    Anthropic::Beta::BetaCodeExecutionTool20250825,
                    Anthropic::Beta::BetaToolComputerUse20241022,
                    Anthropic::Beta::BetaMemoryTool20250818,
                    Anthropic::Beta::BetaToolComputerUse20250124,
                    Anthropic::Beta::BetaToolTextEditor20241022,
                    Anthropic::Beta::BetaToolComputerUse20251124,
                    Anthropic::Beta::BetaToolTextEditor20250124,
                    Anthropic::Beta::BetaToolTextEditor20250429,
                    Anthropic::Beta::BetaToolTextEditor20250728,
                    Anthropic::Beta::BetaWebSearchTool20250305,
                    Anthropic::Beta::BetaWebFetchTool20250910,
                    Anthropic::Beta::BetaToolSearchToolBm25_20251119,
                    Anthropic::Beta::BetaToolSearchToolRegex20251119,
                    Anthropic::Beta::BetaMCPToolset
                  )
                ],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # System prompt.
        #
        # A system prompt is a way of providing context and instructions to Claude, such
        # as specifying a particular goal or role. See our
        # [guide to system prompts](https://docs.claude.com/en/docs/system-prompts).
        module System
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(String, T::Array[Anthropic::Beta::BetaTextBlockParam])
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::MessageCountTokensParams::System::Variants
              ]
            )
          end
          def self.variants
          end

          BetaTextBlockParamArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[
                Anthropic::Beta::BetaTextBlockParam
              ],
              Anthropic::Internal::Type::Converter
            )
        end

        # Configuration for a group of tools from an MCP server.
        #
        # Allows configuring enabled status and defer_loading for all tools from an MCP
        # server, with optional per-tool overrides.
        module Tool
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaTool,
                Anthropic::Beta::BetaToolBash20241022,
                Anthropic::Beta::BetaToolBash20250124,
                Anthropic::Beta::BetaCodeExecutionTool20250522,
                Anthropic::Beta::BetaCodeExecutionTool20250825,
                Anthropic::Beta::BetaToolComputerUse20241022,
                Anthropic::Beta::BetaMemoryTool20250818,
                Anthropic::Beta::BetaToolComputerUse20250124,
                Anthropic::Beta::BetaToolTextEditor20241022,
                Anthropic::Beta::BetaToolComputerUse20251124,
                Anthropic::Beta::BetaToolTextEditor20250124,
                Anthropic::Beta::BetaToolTextEditor20250429,
                Anthropic::Beta::BetaToolTextEditor20250728,
                Anthropic::Beta::BetaWebSearchTool20250305,
                Anthropic::Beta::BetaWebFetchTool20250910,
                Anthropic::Beta::BetaToolSearchToolBm25_20251119,
                Anthropic::Beta::BetaToolSearchToolRegex20251119,
                Anthropic::Beta::BetaMCPToolset
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::MessageCountTokensParams::Tool::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
