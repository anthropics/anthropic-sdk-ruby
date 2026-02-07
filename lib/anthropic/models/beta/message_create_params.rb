# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Messages#create
      #
      # @see Anthropic::Resources::Beta::Messages#stream_raw
      class MessageCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute max_tokens
        #   The maximum number of tokens to generate before stopping.
        #
        #   Note that our models may stop _before_ reaching this maximum. This parameter
        #   only specifies the absolute maximum number of tokens to generate.
        #
        #   Different models have different maximum values for this parameter. See
        #   [models](https://docs.claude.com/en/docs/models-overview) for details.
        #
        #   @return [Integer]
        required :max_tokens, Integer

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

        # @!attribute container
        #   Container identifier for reuse across requests.
        #
        #   @return [Anthropic::Models::Beta::BetaContainerParams, String, nil]
        optional :container, union: -> { Anthropic::Beta::MessageCreateParams::Container }, nil?: true

        # @!attribute context_management
        #   Context management configuration.
        #
        #   This allows you to control how Claude manages context across multiple requests,
        #   such as whether to clear function results or not.
        #
        #   @return [Anthropic::Models::Beta::BetaContextManagementConfig, nil]
        optional :context_management, -> { Anthropic::Beta::BetaContextManagementConfig }, nil?: true

        # @!attribute inference_geo
        #   Specifies the geographic region for inference processing. If not specified, the
        #   workspace's `default_inference_geo` is used.
        #
        #   @return [String, nil]
        optional :inference_geo, String, nil?: true

        # @!attribute mcp_servers
        #   MCP servers to be utilized in this request
        #
        #   @return [Array<Anthropic::Models::Beta::BetaRequestMCPServerURLDefinition>, nil]
        optional :mcp_servers,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaRequestMCPServerURLDefinition] }

        # @!attribute metadata
        #   An object describing metadata about the request.
        #
        #   @return [Anthropic::Models::Beta::BetaMetadata, nil]
        optional :metadata, -> { Anthropic::Beta::BetaMetadata }

        # @!attribute output_config
        #   Configuration options for the model's output, such as the output format.
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

        # @!attribute service_tier
        #   Determines whether to use priority capacity (if available) or standard capacity
        #   for this request.
        #
        #   Anthropic offers different levels of service for your API requests. See
        #   [service-tiers](https://docs.claude.com/en/api/service-tiers) for details.
        #
        #   @return [Symbol, Anthropic::Models::Beta::MessageCreateParams::ServiceTier, nil]
        optional :service_tier, enum: -> { Anthropic::Beta::MessageCreateParams::ServiceTier }

        # @!attribute speed
        #   The inference speed mode for this request. `"fast"` enables high
        #   output-tokens-per-second inference.
        #
        #   @return [Symbol, Anthropic::Models::Beta::MessageCreateParams::Speed, nil]
        optional :speed, enum: -> { Anthropic::Beta::MessageCreateParams::Speed }, nil?: true

        # @!attribute stop_sequences
        #   Custom text sequences that will cause the model to stop generating.
        #
        #   Our models will normally stop when they have naturally completed their turn,
        #   which will result in a response `stop_reason` of `"end_turn"`.
        #
        #   If you want the model to stop generating when it encounters custom strings of
        #   text, you can use the `stop_sequences` parameter. If the model encounters one of
        #   the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
        #   and the response `stop_sequence` value will contain the matched stop sequence.
        #
        #   @return [Array<String>, nil]
        optional :stop_sequences, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute system_
        #   System prompt.
        #
        #   A system prompt is a way of providing context and instructions to Claude, such
        #   as specifying a particular goal or role. See our
        #   [guide to system prompts](https://docs.claude.com/en/docs/system-prompts).
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>, nil]
        optional :system_, union: -> { Anthropic::Beta::MessageCreateParams::System }, api_name: :system

        # @!attribute temperature
        #   Amount of randomness injected into the response.
        #
        #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
        #   for analytical / multiple choice, and closer to `1.0` for creative and
        #   generative tasks.
        #
        #   Note that even with `temperature` of `0.0`, the results will not be fully
        #   deterministic.
        #
        #   @return [Float, nil]
        optional :temperature, Float

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
        #   @return [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigAdaptive, nil]
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
        optional :tools, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaToolUnion] }

        # @!attribute top_k
        #   Only sample from the top K options for each subsequent token.
        #
        #   Used to remove "long tail" low probability responses.
        #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
        #
        #   Recommended for advanced use cases only. You usually only need to use
        #   `temperature`.
        #
        #   @return [Integer, nil]
        optional :top_k, Integer

        # @!attribute top_p
        #   Use nucleus sampling.
        #
        #   In nucleus sampling, we compute the cumulative distribution over all the options
        #   for each subsequent token in decreasing probability order and cut it off once it
        #   reaches a particular probability specified by `top_p`. You should either alter
        #   `temperature` or `top_p`, but not both.
        #
        #   Recommended for advanced use cases only. You usually only need to use
        #   `temperature`.
        #
        #   @return [Float, nil]
        optional :top_p, Float

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(max_tokens:, messages:, model:, container: nil, context_management: nil, inference_geo: nil, mcp_servers: nil, metadata: nil, output_config: nil, output_format: nil, service_tier: nil, speed: nil, stop_sequences: nil, system_: nil, temperature: nil, thinking: nil, tool_choice: nil, tools: nil, top_k: nil, top_p: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::MessageCreateParams} for more details.
        #
        #   @param max_tokens [Integer] The maximum number of tokens to generate before stopping.
        #
        #   @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>] Input messages.
        #
        #   @param model [Symbol, String, Anthropic::Models::Model] The model that will complete your prompt.\n\nSee [models](https://docs.anthropic
        #
        #   @param container [Anthropic::Models::Beta::BetaContainerParams, String, nil] Container identifier for reuse across requests.
        #
        #   @param context_management [Anthropic::Models::Beta::BetaContextManagementConfig, nil] Context management configuration.
        #
        #   @param inference_geo [String, nil] Specifies the geographic region for inference processing. If not specified, the
        #
        #   @param mcp_servers [Array<Anthropic::Models::Beta::BetaRequestMCPServerURLDefinition>] MCP servers to be utilized in this request
        #
        #   @param metadata [Anthropic::Models::Beta::BetaMetadata] An object describing metadata about the request.
        #
        #   @param output_config [Anthropic::Models::Beta::BetaOutputConfig] Configuration options for the model's output, such as the output format.
        #
        #   @param output_format [Anthropic::Models::Beta::BetaJSONOutputFormat, nil] Deprecated: Use `output_config.format` instead. See [structured outputs](https:/
        #
        #   @param service_tier [Symbol, Anthropic::Models::Beta::MessageCreateParams::ServiceTier] Determines whether to use priority capacity (if available) or standard capacity
        #
        #   @param speed [Symbol, Anthropic::Models::Beta::MessageCreateParams::Speed, nil] The inference speed mode for this request. `"fast"` enables high output-tokens-p
        #
        #   @param stop_sequences [Array<String>] Custom text sequences that will cause the model to stop generating.
        #
        #   @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>] System prompt.
        #
        #   @param temperature [Float] Amount of randomness injected into the response.
        #
        #   @param thinking [Anthropic::Models::Beta::BetaThinkingConfigEnabled, Anthropic::Models::Beta::BetaThinkingConfigDisabled, Anthropic::Models::Beta::BetaThinkingConfigAdaptive] Configuration for enabling Claude's extended thinking.
        #
        #   @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool, Anthropic::Models::Beta::BetaToolChoiceNone] How the model should use the provided tools. The model can use a specific tool,
        #
        #   @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaCodeExecutionTool20250522, Anthropic::Models::Beta::BetaCodeExecutionTool20250825, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaMemoryTool20250818, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20251124, Anthropic::Models::Beta::BetaToolTextEditor20250124, Anthropic::Models::Beta::BetaToolTextEditor20250429, Anthropic::Models::Beta::BetaToolTextEditor20250728, Anthropic::Models::Beta::BetaWebSearchTool20250305, Anthropic::Models::Beta::BetaWebFetchTool20250910, Anthropic::Models::Beta::BetaToolSearchToolBm25_20251119, Anthropic::Models::Beta::BetaToolSearchToolRegex20251119, Anthropic::Models::Beta::BetaMCPToolset>] Definitions of tools that the model may use.
        #
        #   @param top_k [Integer] Only sample from the top K options for each subsequent token.
        #
        #   @param top_p [Float] Use nucleus sampling.
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Container identifier for reuse across requests.
        module Container
          extend Anthropic::Internal::Type::Union

          # Container parameters with skills to be loaded.
          variant -> { Anthropic::Beta::BetaContainerParams }

          variant String

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaContainerParams, String)]
        end

        # Determines whether to use priority capacity (if available) or standard capacity
        # for this request.
        #
        # Anthropic offers different levels of service for your API requests. See
        # [service-tiers](https://docs.claude.com/en/api/service-tiers) for details.
        module ServiceTier
          extend Anthropic::Internal::Type::Enum

          AUTO = :auto
          STANDARD_ONLY = :standard_only

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The inference speed mode for this request. `"fast"` enables high
        # output-tokens-per-second inference.
        module Speed
          extend Anthropic::Internal::Type::Enum

          STANDARD = :standard
          FAST = :fast

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # System prompt.
        #
        # A system prompt is a way of providing context and instructions to Claude, such
        # as specifying a particular goal or role. See our
        # [guide to system prompts](https://docs.claude.com/en/docs/system-prompts).
        module System
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::MessageCreateParams::System::BetaTextBlockParamArray }

          # @!method self.variants
          #   @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam>)]

          # @type [Anthropic::Internal::Type::Converter]
          BetaTextBlockParamArray = Anthropic::Internal::Type::ArrayOf[-> {
            Anthropic::Beta::BetaTextBlockParam
          }]
        end
      end
    end
  end
end
