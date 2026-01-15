# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Messages#count_tokens
      class MessageCountTokensParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
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
        #   See [input examples](https://docs.claude.com/en/api/messages-examples).
        #
        #   Note that if you want to include a
        #   [system prompt](https://docs.claude.com/en/docs/system-prompts), you can use the
        #   top-level `system` parameter — there is no `"system"` role for input messages in
        #   the Messages API.
        #
        #   There is a limit of 100,000 messages in a single request.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaMessageParam>]
        required :messages, -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaMessageParam] }

        # @!attribute model
        #   The model that will complete your prompt.\n\nSee
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        #
        #   @return [Symbol, String, Anthropic::Models::Model]
        required :model, union: -> { Anthropic::Model }

        # @!attribute context_management
        #   Context management configuration.
        #
        #   This allows you to control how Claude manages context across multiple requests,
        #   such as whether to clear function results or not.
        #
        #   @return [Anthropic::Models::Beta::BetaContextManagementConfig, nil]
        optional :context_management, -> { Anthropic::Beta::BetaContextManagementConfig }, nil?: true

        # @!attribute mcp_servers
        #   MCP servers to be utilized in this request
        #
        #   @return [Array<Anthropic::Models::Beta::BetaRequestMCPServerURLDefinition>, nil]
        optional :mcp_servers,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaRequestMCPServerURLDefinition] }

        # @!attribute output_config
        #   Configuration options for the model's output. Controls aspects like output
        #   format or how much effort the model puts into its response.
        #
        #   @return [Anthropic::Models::Beta::BetaOutputConfig, nil]
        optional :output_config, -> { Anthropic::Beta::BetaOutputConfig }

        # @!attribute output_format
        #   @deprecated
        #
        #   Deprecated: Use `output_config.format` instead. See
        #   [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
        #
        #   A schema to specify Claude's output format in responses. This parameter will be
        #   removed in a future release.
        #
        #   @return [Anthropic::Models::Beta::BetaJSONOutputFormat, nil]
        optional :output_format, -> { Anthropic::Beta::BetaJSONOutputFormat }, nil?: true

        # @!attribute system_
        #   System prompt.
        #
        #   A system prompt is a way of providing context and instructions to Claude, such
        #   as specifying a particular goal or role. See our
        #   [guide to system prompts](https://docs.claude.com/en/docs/system-prompts).
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>, nil]
        optional :system_, union: -> { Anthropic::Beta::MessageCountTokensParams::System }, api_name: :system

        # @!attribute thinking
        #   Configuration for enabling Claude's extended thinking.
        #
        #   When enabled, responses include `thinking` content blocks showing Claude's
        #   thinking process before the final answer. Requires a minimum budget of 1,024
        #   tokens and counts towards your `max_tokens` limit.
        #
        #   See
        #   [extended thinking](https://docs.claude.com/en/docs/build-with-claude/extended-thinking)
        #   for details.
        #
        #   @return [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, nil]
        optional :thinking, union: -> { Anthropic::Beta::BetaThinkingConfigParam }

        # @!attribute tool_choice
        #   How the model should use the provided tools. The model can use a specific tool,
        #   any available tool, decide by itself, or not use tools at all.
        #
        #   @return [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone, nil]
        optional :tool_choice, union: -> { Anthropic::Beta::BetaToolChoice }

        # @!attribute tools
        #   Definitions of tools that the model may use.
        #
        #   If you include `tools` in your API request, the model may return `tool_use`
        #   content blocks that represent the model's use of those tools. You can then run
        #   those tools using the tool input generated by the model and then optionally
        #   return results back to the model using `tool_result` content blocks.
        #
        #   There are two types of tools: **client tools** and **server tools**. The
        #   behavior described below applies to client tools. For
        #   [server tools](https://docs.claude.com/en/docs/agents-and-tools/tool-use/overview#server-tools),
        #   see their individual documentation as each has its own behavior (e.g., the
        #   [web search tool](https://docs.claude.com/en/docs/agents-and-tools/tool-use/web-search-tool)).
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
        #   See our [guide](https://docs.claude.com/en/docs/tool-use) for more details.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaCodeExecutionTool20250522, Anthropic::Models::Beta::BetaCodeExecutionTool20250825, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaMemoryTool20250818, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20251124, Anthropic::Models::Beta::BetaToolTextEditor20250124, Anthropic::Models::Beta::BetaToolTextEditor20250429, Anthropic::Models::Beta::BetaToolTextEditor20250728, Anthropic::Models::Beta::BetaWebSearchTool20250305, Anthropic::Models::Beta::BetaWebFetchTool20250910, Anthropic::Models::Beta::BetaToolSearchToolBm25_20251119, Anthropic::Models::Beta::BetaToolSearchToolRegex20251119, Anthropic::Models::Beta::BetaMCPToolset>, nil]
        optional :tools,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::MessageCountTokensParams::Tool] }

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(messages:, model:, context_management: nil, mcp_servers: nil, output_config: nil, output_format: nil, system_: nil, thinking: nil, tool_choice: nil, tools: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::MessageCountTokensParams} for more details.
        #
        #   @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>] Input messages.
        #
        #   @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
        #
        #   @param context_management [Anthropic::Models::Beta::BetaContextManagementConfig, nil] Context management configuration.
        #
        #   @param mcp_servers [Array<Anthropic::Models::Beta::BetaRequestMCPServerURLDefinition>] MCP servers to be utilized in this request
        #
        #   @param output_config [Anthropic::Models::Beta::BetaOutputConfig] Configuration options for the model's output. Controls aspects like output forma
        #
        #   @param output_format [Anthropic::Models::Beta::BetaJSONOutputFormat, nil] Deprecated: Use `output_config.format` instead. See [structured outputs](https:/
        #
        #   @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>] System prompt.
        #
        #   @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled] Configuration for enabling Claude's extended thinking.
        #
        #   @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone] How the model should use the provided tools. The model can use a specific tool,
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaCodeExecutionTool20250522, Anthropic::Models::Beta::BetaCodeExecutionTool20250825, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaMemoryTool20250818, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20251124, Anthropic::Models::Beta::BetaToolTextEditor20250124, Anthropic::Models::Beta::BetaToolTextEditor20250429, Anthropic::Models::Beta::BetaToolTextEditor20250728, Anthropic::Models::Beta::BetaWebSearchTool20250305, Anthropic::Models::Beta::BetaWebFetchTool20250910, Anthropic::Models::Beta::BetaToolSearchToolBm25_20251119, Anthropic::Models::Beta::BetaToolSearchToolRegex20251119, Anthropic::Models::Beta::BetaMCPToolset>] Definitions of tools that the model may use.
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # System prompt.
        #
        # A system prompt is a way of providing context and instructions to Claude, such
        # as specifying a particular goal or role. See our
        # [guide to system prompts](https://docs.claude.com/en/docs/system-prompts).
        module System
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::MessageCountTokensParams::System::BetaTextBlockParamArray }

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam>)]

          # @type [Anthropic::Internal::Type::Converter]
          BetaTextBlockParamArray = Anthropic::Internal::Type::ArrayOf[-> {
            Anthropic::Beta::BetaTextBlockParam
          }]
        end

        # Configuration for a group of tools from an MCP server.
        #
        # Allows configuring enabled status and defer_loading for all tools from an MCP
        # server, with optional per-tool overrides.
        module Tool
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaTool }

          variant -> { Anthropic::Beta::BetaToolBash20241022 }

          variant -> { Anthropic::Beta::BetaToolBash20250124 }

          variant -> { Anthropic::Beta::BetaCodeExecutionTool20250522 }

          variant -> { Anthropic::Beta::BetaCodeExecutionTool20250825 }

          variant -> { Anthropic::Beta::BetaToolComputerUse20241022 }

          variant -> { Anthropic::Beta::BetaMemoryTool20250818 }

          variant -> { Anthropic::Beta::BetaToolComputerUse20250124 }

          variant -> { Anthropic::Beta::BetaToolTextEditor20241022 }

          variant -> { Anthropic::Beta::BetaToolComputerUse20251124 }

          variant -> { Anthropic::Beta::BetaToolTextEditor20250124 }

          variant -> { Anthropic::Beta::BetaToolTextEditor20250429 }

          variant -> { Anthropic::Beta::BetaToolTextEditor20250728 }

          variant -> { Anthropic::Beta::BetaWebSearchTool20250305 }

          variant -> { Anthropic::Beta::BetaWebFetchTool20250910 }

          variant -> { Anthropic::Beta::BetaToolSearchToolBm25_20251119 }

          variant -> { Anthropic::Beta::BetaToolSearchToolRegex20251119 }

          # Configuration for a group of tools from an MCP server.
          #
          # Allows configuring enabled status and defer_loading for all tools
          # from an MCP server, with optional per-tool overrides.
          variant -> { Anthropic::Beta::BetaMCPToolset }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaCodeExecutionTool20250522, Anthropic::Models::Beta::BetaCodeExecutionTool20250825, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaMemoryTool20250818, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20251124, Anthropic::Models::Beta::BetaToolTextEditor20250124, Anthropic::Models::Beta::BetaToolTextEditor20250429, Anthropic::Models::Beta::BetaToolTextEditor20250728, Anthropic::Models::Beta::BetaWebSearchTool20250305, Anthropic::Models::Beta::BetaWebFetchTool20250910, Anthropic::Models::Beta::BetaToolSearchToolBm25_20251119, Anthropic::Models::Beta::BetaToolSearchToolRegex20251119, Anthropic::Models::Beta::BetaMCPToolset)]
        end
      end
    end
  end
end
