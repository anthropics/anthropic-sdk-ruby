# typed: strong

module Anthropic
  module Resources
    class Beta
      class Messages
        sig { returns(Anthropic::Resources::Beta::Messages::Batches) }
        attr_reader :batches

        sig do
          params(
            max_tokens: Integer,
            messages:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaMessageParam::Variants,
                  Anthropic::Internal::AnyHash
                )
              ],
            model: T.any(Anthropic::Model::OrSymbol, String),
            container:
              T.nilable(
                T.any(Anthropic::Beta::BetaContainerParams::OrHash, String)
              ),
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementConfig::OrHash),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaRequestMCPServerURLDefinition::OrHash
              ],
            metadata: Anthropic::Beta::BetaMetadata::OrHash,
            service_tier:
              Anthropic::Beta::MessageCreateParams::ServiceTier::OrSymbol,
            stop_sequences: T::Array[String],
            system_: Anthropic::Beta::MessageCreateParams::System::Variants,
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
                  Anthropic::Beta::BetaToolTextEditor20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250429::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250728::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20250305::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20250910::OrHash
                )
              ],
            betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
            max_iterations: T.nilable(Integer),
            thread: T.nilable(FalseClass),
            stream: T.noreturn,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Helpers::Tools::Runner)
        end
        def tool_runner(
          # Body param: The maximum number of tokens to generate before stopping.
          #
          # Note that our models may stop _before_ reaching this maximum. This parameter
          # only specifies the absolute maximum number of tokens to generate.
          #
          # Different models have different maximum values for this parameter. See
          # [models](https://docs.claude.com/en/docs/models-overview) for details.
          max_tokens:,
          # Body param: Input messages.
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
          # top-level `system` parameter.
          #
          # There is a limit of 100,000 messages in a single request.
          messages:,
          # Body param: The model that will complete your prompt.\n\nSee
          # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          model:,
          # Body param: Container identifier for reuse across requests.
          container: nil,
          # Body param: Context management configuration.
          #
          # This allows you to control how Claude manages context across multiple requests,
          # such as whether to clear function results or not.
          context_management: nil,
          # Body param: MCP servers to be utilized in this request
          mcp_servers: nil,
          # Body param: An object describing metadata about the request.
          metadata: nil,
          # Body param: Determines whether to use priority capacity (if available) or
          # standard capacity for this request.
          #
          # Anthropic offers different levels of service for your API requests. See
          # [service-tiers](https://docs.claude.com/en/api/service-tiers) for details.
          service_tier: nil,
          # Body param: Custom text sequences that will cause the model to stop generating.
          #
          # Our models will normally stop when they have naturally completed their turn,
          # which will result in a response `stop_reason` of `"end_turn"`.
          #
          # If you want the model to stop generating when it encounters custom strings of
          # text, you can use the `stop_sequences` parameter. If the model encounters one of
          # the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
          # and the response `stop_sequence` value will contain the matched stop sequence.
          stop_sequences: nil,
          # Body param: System prompt.
          #
          # A system prompt is a way of providing context and instructions to Claude, such
          # as specifying a particular goal or role. See our
          # [guide to system prompts](https://docs.claude.com/en/docs/system-prompts).
          system_: nil,
          # Body param: Configuration for enabling Claude's extended thinking.
          #
          # When enabled, responses include `thinking` content blocks showing Claude's
          # thinking process before the final answer. Requires a minimum budget of 1,024
          # tokens and counts towards your `max_tokens` limit.
          #
          # See
          # [extended thinking](https://docs.claude.com/en/docs/build-with-claude/extended-thinking)
          # for details.
          thinking: nil,
          # Body param: How the model should use the provided tools. The model can use a
          # specific tool, any available tool, decide by itself, or not use tools at all.
          tool_choice: nil,
          # Body param: Definitions of tools that the model may use.
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
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # The most requests the runner sends before it stops. No limit when `nil`.
          max_iterations: nil,
          # The runner sends its requests on a message thread, so that each request after
          # the first carries only the messages that are new. `false` sends the whole
          # history with every request instead. `nil` leaves the thread on, and anything
          # else raises `ArgumentError`.
          thread: nil,
          # There is no need to provide `stream:`. Instead, use `#stream_raw` or `#create`
          # for streaming and non-streaming use cases, respectively.
          stream: false,
          request_options: {}
        )
        end

        # Creates a message thread: a conversation that the API keeps between requests, so
        # that each turn sends only the messages that are new. It sends no request.
        #
        # Takes the keywords of `#create` except `thread` and `stream`.
        sig do
          params(
            max_tokens: Integer,
            model: T.any(Anthropic::Model::OrSymbol, String),
            messages:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaUserMessageParam::OrHash,
                  Anthropic::Beta::BetaAssistantMessageParam::OrHash,
                  Anthropic::Beta::BetaSystemMessageParam::OrHash
                )
              ],
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            compaction:
              T.nilable(Anthropic::Beta::BetaCompactionConfig::OrHash),
            container:
              T.nilable(
                T.any(Anthropic::Beta::BetaContainerParams::OrHash, String)
              ),
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementConfig::OrHash),
            diagnostics:
              T.nilable(Anthropic::Beta::BetaDiagnosticsParam::OrHash),
            fallback_credit_token:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaFallbackCreditTokenParam::OrHash,
                  String
                )
              ),
            fallbacks:
              T.nilable(
                T.any(
                  Symbol,
                  T::Array[Anthropic::Beta::BetaFallbackParam::OrHash]
                )
              ),
            inference_geo: T.nilable(String),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaRequestMCPServerURLDefinition::OrHash
              ],
            metadata: Anthropic::Beta::BetaMetadata::OrHash,
            output_config: Anthropic::Beta::BetaOutputConfig::OrHash,
            output_format:
              T.nilable(Anthropic::Beta::BetaJSONOutputFormat::OrHash),
            service_tier:
              Anthropic::Beta::MessageCreateParams::ServiceTier::OrSymbol,
            speed:
              T.nilable(Anthropic::Beta::MessageCreateParams::Speed::OrSymbol),
            stop_sequences: T::Array[String],
            system_: Anthropic::Beta::MessageCreateParams::System::Variants,
            thinking:
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigDisabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigBetweenTools::OrHash,
                Anthropic::Beta::BetaThinkingConfigAdaptive::OrHash
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
                  Anthropic::Beta::BetaCodeExecutionTool20260120::OrHash,
                  Anthropic::Beta::BetaCodeExecutionTool20260521::OrHash,
                  Anthropic::Beta::BetaBrowserToolset20260801::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20241022::OrHash,
                  Anthropic::Beta::BetaMemoryTool20250818::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20241022::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20251124::OrHash,
                  Anthropic::Beta::BetaComputerToolset20260801::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250429::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250728::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20250305::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20250910::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20260209::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260209::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260309::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20260318::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260318::OrHash,
                  Anthropic::Beta::BetaAdvisorTool20260301::OrHash,
                  Anthropic::Beta::BetaToolSearchToolBm25_20251119::OrHash,
                  Anthropic::Beta::BetaToolSearchToolRegex20251119::OrHash,
                  Anthropic::Beta::BetaMCPToolset::OrHash
                )
              ],
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            user_profile_id: String,
            workspace_id: String,
            unsupported_request_behavior: Symbol,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Helpers::Threads::BetaMessageThread)
        end
        def thread(
          max_tokens:,
          model:,
          # The messages that seed the history. The first turn sends them.
          messages: nil,
          cache_control: nil,
          compaction: nil,
          container: nil,
          context_management: nil,
          diagnostics: nil,
          fallback_credit_token: nil,
          fallbacks: nil,
          inference_geo: nil,
          mcp_servers: nil,
          metadata: nil,
          output_config: nil,
          output_format: nil,
          service_tier: nil,
          speed: nil,
          stop_sequences: nil,
          system_: nil,
          thinking: nil,
          tool_choice: nil,
          tools: nil,
          betas: nil,
          user_profile_id: nil,
          workspace_id: nil,
          # What a turn does when the API cannot serve the request on a thread: `:error`
          # (the default) raises the error, and `:continue_unthreaded` sends the turn again,
          # and every later turn, with the whole history and no thread.
          unsupported_request_behavior: :error,
          request_options: {}
        )
        end

        # See {Anthropic::Resources::Beta::Messages#stream_raw} for streaming counterpart.
        #
        # Send a structured list of input messages with text and/or image content, and the
        # model will generate the next message in the conversation.
        #
        # The Messages API can be used for either single queries or stateless multi-turn
        # conversations.
        #
        # Learn more about the Messages API in our
        # [user guide](https://platform.claude.com/docs/en/get-started)
        sig do
          params(
            max_tokens: Integer,
            messages:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaUserMessageParam::OrHash,
                  Anthropic::Beta::BetaAssistantMessageParam::OrHash,
                  Anthropic::Beta::BetaSystemMessageParam::OrHash
                )
              ],
            model: T.any(Anthropic::Model::OrSymbol, String),
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            compaction:
              T.nilable(Anthropic::Beta::BetaCompactionConfig::OrHash),
            container:
              T.nilable(
                T.any(Anthropic::Beta::BetaContainerParams::OrHash, String)
              ),
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementConfig::OrHash),
            diagnostics:
              T.nilable(Anthropic::Beta::BetaDiagnosticsParam::OrHash),
            fallback_credit_token:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaFallbackCreditTokenParam::OrHash,
                  String
                )
              ),
            fallbacks:
              T.nilable(
                T.any(
                  Symbol,
                  T::Array[Anthropic::Beta::BetaFallbackParam::OrHash]
                )
              ),
            inference_geo: T.nilable(String),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaRequestMCPServerURLDefinition::OrHash
              ],
            metadata: Anthropic::Beta::BetaMetadata::OrHash,
            output_config: Anthropic::Beta::BetaOutputConfig::OrHash,
            output_format:
              T.nilable(Anthropic::Beta::BetaJSONOutputFormat::OrHash),
            service_tier:
              Anthropic::Beta::MessageCreateParams::ServiceTier::OrSymbol,
            speed:
              T.nilable(Anthropic::Beta::MessageCreateParams::Speed::OrSymbol),
            stop_sequences: T::Array[String],
            system_: Anthropic::Beta::MessageCreateParams::System::Variants,
            thinking:
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigDisabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigBetweenTools::OrHash,
                Anthropic::Beta::BetaThinkingConfigAdaptive::OrHash
              ),
            thread:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaThreadCreateParams::OrHash,
                  Anthropic::Beta::BetaThreadContinueParams::OrHash
                )
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
                  Anthropic::Beta::BetaCodeExecutionTool20260120::OrHash,
                  Anthropic::Beta::BetaCodeExecutionTool20260521::OrHash,
                  Anthropic::Beta::BetaBrowserToolset20260801::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20241022::OrHash,
                  Anthropic::Beta::BetaMemoryTool20250818::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20241022::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20251124::OrHash,
                  Anthropic::Beta::BetaComputerToolset20260801::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250429::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250728::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20250305::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20250910::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20260209::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260209::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260309::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20260318::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260318::OrHash,
                  Anthropic::Beta::BetaAdvisorTool20260301::OrHash,
                  Anthropic::Beta::BetaToolSearchToolBm25_20251119::OrHash,
                  Anthropic::Beta::BetaToolSearchToolRegex20251119::OrHash,
                  Anthropic::Beta::BetaMCPToolset::OrHash
                )
              ],
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            user_profile_id: String,
            workspace_id: String,
            stream: T.noreturn,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaMessage)
        end
        def create(
          # Body param: The maximum number of tokens to generate before stopping.
          #
          # Note that our models may stop _before_ reaching this maximum. This parameter
          # only specifies the absolute maximum number of tokens to generate.
          #
          # Set to `0` to populate the
          # [prompt cache](https://platform.claude.com/docs/en/build-with-claude/prompt-caching#pre-warming-the-cache)
          # without generating a response.
          #
          # Different models have different maximum values for this parameter. See
          # [models](https://platform.claude.com/docs/en/about-claude/models/overview) for
          # details.
          max_tokens:,
          # Body param: Input messages.
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
          # constrain part of the model's response. This is called prefill. On models that
          # don't support prefill, creating a message that ends with a partial `assistant`
          # response returns a 400 error. See
          # [Prefill not supported](https://platform.claude.com/docs/en/api/errors#prefill-not-supported).
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
          # Example with a partially-filled response from Claude, for models that support
          # prefill:
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
          # See
          # [input examples](https://platform.claude.com/docs/en/build-with-claude/working-with-messages).
          #
          # Note that if you want to include a
          # [system prompt](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices#give-claude-a-role),
          # you can use the top-level `system` parameter.
          #
          # There is a limit of 100,000 messages in a single request.
          messages:,
          # Body param: The model that will complete your prompt.
          #
          # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          model:,
          # Body param: Top-level cache control automatically applies a cache_control marker
          # to the last cacheable block in the request.
          cache_control: nil,
          # Body param: Compaction configuration.
          #
          # When set on `POST /v1/messages`, the request is a compaction request: the
          # conversation in `messages` is summarized and the response holds only the
          # resulting `compaction` block (`stop_reason` `"compaction"`), which later
          # requests send first in `messages` in place of the messages it summarizes.
          # `POST /v1/messages/count_tokens` accepts this parameter and ignores it: the
          # count it returns is for the conversation in `messages` as sent. Cannot be
          # combined with `context_management`.
          compaction: nil,
          # Body param: Container identifier for reuse across requests.
          container: nil,
          # Body param: Context management configuration.
          #
          # This allows you to control how Claude manages context across multiple requests,
          # such as whether to clear function results or not.
          context_management: nil,
          # Body param: Request-level diagnostics. Supply `previous_message_id` to have the
          # response include `diagnostics.cache_miss_reason` explaining any prompt-cache
          # divergence from that prior request.
          diagnostics: nil,
          # Body param: The `fallback_credit_token` from a prior refusal's `stop_details`.
          #
          # When a preceding request was refused and returned a `fallback_credit_token`,
          # pass that code here on the retry to have the retry's cache-creation tokens for
          # the prefix that was warm on the refused model billed at the cache-read rate.
          # Must be redeemed by the same organization and workspace, with the same request
          # body (optionally extended by one appended `assistant` message whose content is
          # the partial text — with any trailing whitespace stripped from the final text
          # block — and paired server-tool blocks streamed before the refusal; the
          # appended-assistant form is not available for requests with `output_format` set
          # or forced `tool_choice`), on an eligible fallback model, on the same platform,
          # and within 5 minutes of the refusal; a mismatch is a 400. A token minted
          # mid-server-tool-loop whose partial content was continuable may only be redeemed
          # with the appended-assistant form — if an exact-body retry is rejected with a 400
          # saying the token must be redeemed by continuing the partial response, retry with
          # the appended-assistant form instead.
          #
          # When the appended-assistant form is used on a model that otherwise disallows
          # assistant-turn prefill, this token also authorizes that one prefill.
          fallback_credit_token: nil,
          # Body param: Opt-in server-side retry on one or more substitute models when the
          # requested model declines for policy reasons. Tried in order: if the first entry
          # also declines, the second is tried, and so on. Some models don't support
          # fallbacks; on those models, a list of fallback models returns a 400 error. See
          # [Server-side fallback](https://platform.claude.com/docs/en/build-with-claude/refusals-and-fallback#server-side-fallback).
          # The string "default" requests the requested model's server-defined default
          # fallback configuration. On a model that doesn't support fallbacks, the request
          # runs on the requested model alone, so a declined request stays declined.
          fallbacks: nil,
          # Body param: Specifies the geographic region for inference processing. If not
          # specified, the workspace's `default_inference_geo` is used.
          inference_geo: nil,
          # Body param: MCP servers to be utilized in this request
          mcp_servers: nil,
          # Body param: An object describing metadata about the request.
          metadata: nil,
          # Body param: Configuration options for the model's output, such as the output
          # format.
          output_config: nil,
          # Body param: Deprecated: Use `output_config.format` instead. See
          # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
          #
          # A schema to specify Claude's output format in responses. This parameter will be
          # removed in a future release.
          output_format: nil,
          # Body param: Determines whether to use priority capacity (if available) or
          # standard capacity for this request.
          #
          # Anthropic offers different levels of service for your API requests. See
          # [service-tiers](https://platform.claude.com/docs/en/api/service-tiers) for
          # details.
          service_tier: nil,
          # Body param: The inference speed mode for this request. `"fast"` enables high
          # output-tokens-per-second inference.
          #
          # Some models require the `fast-mode-2026-02-01` beta header for any `speed`
          # value. See
          # [fast mode](https://platform.claude.com/docs/en/build-with-claude/fast-mode) for
          # which models.
          speed: nil,
          # Body param: Custom text sequences that will cause the model to stop generating.
          #
          # Our models will normally stop when they have naturally completed their turn,
          # which will result in a response `stop_reason` of `"end_turn"`.
          #
          # If you want the model to stop generating when it encounters custom strings of
          # text, you can use the `stop_sequences` parameter. If the model encounters one of
          # the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
          # and the response `stop_sequence` value will contain the matched stop sequence.
          stop_sequences: nil,
          # Body param: System prompt.
          #
          # A system prompt is a way of providing context and instructions to Claude, such
          # as specifying a particular goal or role. See our
          # [guide to system prompts](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices#give-claude-a-role).
          system_: nil,
          # Body param: Configuration for Claude's thinking.
          #
          # With `{"type": "adaptive"}`, Claude decides when and how much to think. With
          # `{"type": "enabled"}` (manual extended thinking), you set a `budget_tokens` of
          # at least 1,024. Thinking tokens count toward your `max_tokens` limit.
          #
          # Which `type` values are accepted, and what happens when you omit `thinking`,
          # depend on the model. See
          # [thinking](https://platform.claude.com/docs/en/build-with-claude/thinking#configuring-thinking)
          # for each model's behavior.
          thinking: nil,
          # Body param: Server-held conversation state (a Thread). `{"type": "create"}` asks
          # the server to hold this conversation's state under the response's `id`;
          # `{"type": "continue", "previous_message_id": ...}` resumes from a previous
          # response so only the new turn's messages are sent. The response shape is
          # unchanged.
          thread: nil,
          # Body param: How the model should use the provided tools. The model can use a
          # specific tool, any available tool, decide by itself, or not use tools at all.
          tool_choice: nil,
          # Body param: Definitions of tools that the model may use.
          #
          # If you include `tools` in your API request, the model may return `tool_use`
          # content blocks that represent the model's use of those tools. You can then run
          # those tools using the tool input generated by the model and then optionally
          # return results back to the model using `tool_result` content blocks.
          #
          # There are two types of tools: **client tools** and **server tools**. The
          # behavior described below applies to client tools. For
          # [server tools](https://platform.claude.com/docs/en/agents-and-tools/tool-use/server-tools),
          # see their individual documentation as each has its own behavior (e.g., the
          # [web search tool](https://platform.claude.com/docs/en/agents-and-tools/tool-use/web-search-tool)).
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
          # See our
          # [guide](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)
          # for more details.
          tools: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Header param: The user profile ID to attribute this request to. Use when acting
          # on behalf of a party other than your organization.
          user_profile_id: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          # There is no need to provide `stream:`. Instead, use `#stream_raw` or `#create`
          # for streaming and non-streaming use cases, respectively.
          stream: false,
          request_options: {}
        )
        end

        # See {Anthropic::Resources::Beta::Messages#create} for non-streaming counterpart.
        #
        # Send a structured list of input messages with text and/or image content, and the
        # model will generate the next message in the conversation.
        #
        # The Messages API can be used for either single queries or stateless multi-turn
        # conversations.
        #
        # Learn more about the Messages API in our
        # [user guide](https://platform.claude.com/docs/en/get-started)
        sig do
          params(
            max_tokens: Integer,
            messages:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaUserMessageParam::OrHash,
                  Anthropic::Beta::BetaAssistantMessageParam::OrHash,
                  Anthropic::Beta::BetaSystemMessageParam::OrHash
                )
              ],
            model: T.any(Anthropic::Model::OrSymbol, String),
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            compaction:
              T.nilable(Anthropic::Beta::BetaCompactionConfig::OrHash),
            container:
              T.nilable(
                T.any(Anthropic::Beta::BetaContainerParams::OrHash, String)
              ),
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementConfig::OrHash),
            diagnostics:
              T.nilable(Anthropic::Beta::BetaDiagnosticsParam::OrHash),
            fallback_credit_token:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaFallbackCreditTokenParam::OrHash,
                  String
                )
              ),
            fallbacks:
              T.nilable(
                T.any(
                  Symbol,
                  T::Array[Anthropic::Beta::BetaFallbackParam::OrHash]
                )
              ),
            inference_geo: T.nilable(String),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaRequestMCPServerURLDefinition::OrHash
              ],
            metadata: Anthropic::Beta::BetaMetadata::OrHash,
            output_config: Anthropic::Beta::BetaOutputConfig::OrHash,
            output_format:
              T.nilable(Anthropic::Beta::BetaJSONOutputFormat::OrHash),
            service_tier:
              Anthropic::Beta::MessageCreateParams::ServiceTier::OrSymbol,
            speed:
              T.nilable(Anthropic::Beta::MessageCreateParams::Speed::OrSymbol),
            stop_sequences: T::Array[String],
            system_: Anthropic::Beta::MessageCreateParams::System::Variants,
            thinking:
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigDisabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigBetweenTools::OrHash,
                Anthropic::Beta::BetaThinkingConfigAdaptive::OrHash
              ),
            thread:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaThreadCreateParams::OrHash,
                  Anthropic::Beta::BetaThreadContinueParams::OrHash
                )
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
                  Anthropic::Beta::BetaCodeExecutionTool20260120::OrHash,
                  Anthropic::Beta::BetaCodeExecutionTool20260521::OrHash,
                  Anthropic::Beta::BetaBrowserToolset20260801::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20241022::OrHash,
                  Anthropic::Beta::BetaMemoryTool20250818::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20241022::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20251124::OrHash,
                  Anthropic::Beta::BetaComputerToolset20260801::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250429::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250728::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20250305::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20250910::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20260209::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260209::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260309::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20260318::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260318::OrHash,
                  Anthropic::Beta::BetaAdvisorTool20260301::OrHash,
                  Anthropic::Beta::BetaToolSearchToolBm25_20251119::OrHash,
                  Anthropic::Beta::BetaToolSearchToolRegex20251119::OrHash,
                  Anthropic::Beta::BetaMCPToolset::OrHash
                )
              ],
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            user_profile_id: String,
            workspace_id: String,
            stream: T.noreturn,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(
            Anthropic::Internal::Type::BaseStream[
              T.noreturn,
              Anthropic::Beta::BetaRawMessageStreamEvent::Variants
            ]
          )
        end
        def stream_raw(
          # Body param: The maximum number of tokens to generate before stopping.
          #
          # Note that our models may stop _before_ reaching this maximum. This parameter
          # only specifies the absolute maximum number of tokens to generate.
          #
          # Set to `0` to populate the
          # [prompt cache](https://platform.claude.com/docs/en/build-with-claude/prompt-caching#pre-warming-the-cache)
          # without generating a response.
          #
          # Different models have different maximum values for this parameter. See
          # [models](https://platform.claude.com/docs/en/about-claude/models/overview) for
          # details.
          max_tokens:,
          # Body param: Input messages.
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
          # constrain part of the model's response. This is called prefill. On models that
          # don't support prefill, creating a message that ends with a partial `assistant`
          # response returns a 400 error. See
          # [Prefill not supported](https://platform.claude.com/docs/en/api/errors#prefill-not-supported).
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
          # Example with a partially-filled response from Claude, for models that support
          # prefill:
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
          # See
          # [input examples](https://platform.claude.com/docs/en/build-with-claude/working-with-messages).
          #
          # Note that if you want to include a
          # [system prompt](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices#give-claude-a-role),
          # you can use the top-level `system` parameter.
          #
          # There is a limit of 100,000 messages in a single request.
          messages:,
          # Body param: The model that will complete your prompt.
          #
          # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          model:,
          # Body param: Top-level cache control automatically applies a cache_control marker
          # to the last cacheable block in the request.
          cache_control: nil,
          # Body param: Compaction configuration.
          #
          # When set on `POST /v1/messages`, the request is a compaction request: the
          # conversation in `messages` is summarized and the response holds only the
          # resulting `compaction` block (`stop_reason` `"compaction"`), which later
          # requests send first in `messages` in place of the messages it summarizes.
          # `POST /v1/messages/count_tokens` accepts this parameter and ignores it: the
          # count it returns is for the conversation in `messages` as sent. Cannot be
          # combined with `context_management`.
          compaction: nil,
          # Body param: Container identifier for reuse across requests.
          container: nil,
          # Body param: Context management configuration.
          #
          # This allows you to control how Claude manages context across multiple requests,
          # such as whether to clear function results or not.
          context_management: nil,
          # Body param: Request-level diagnostics. Supply `previous_message_id` to have the
          # response include `diagnostics.cache_miss_reason` explaining any prompt-cache
          # divergence from that prior request.
          diagnostics: nil,
          # Body param: The `fallback_credit_token` from a prior refusal's `stop_details`.
          #
          # When a preceding request was refused and returned a `fallback_credit_token`,
          # pass that code here on the retry to have the retry's cache-creation tokens for
          # the prefix that was warm on the refused model billed at the cache-read rate.
          # Must be redeemed by the same organization and workspace, with the same request
          # body (optionally extended by one appended `assistant` message whose content is
          # the partial text — with any trailing whitespace stripped from the final text
          # block — and paired server-tool blocks streamed before the refusal; the
          # appended-assistant form is not available for requests with `output_format` set
          # or forced `tool_choice`), on an eligible fallback model, on the same platform,
          # and within 5 minutes of the refusal; a mismatch is a 400. A token minted
          # mid-server-tool-loop whose partial content was continuable may only be redeemed
          # with the appended-assistant form — if an exact-body retry is rejected with a 400
          # saying the token must be redeemed by continuing the partial response, retry with
          # the appended-assistant form instead.
          #
          # When the appended-assistant form is used on a model that otherwise disallows
          # assistant-turn prefill, this token also authorizes that one prefill.
          fallback_credit_token: nil,
          # Body param: Opt-in server-side retry on one or more substitute models when the
          # requested model declines for policy reasons. Tried in order: if the first entry
          # also declines, the second is tried, and so on. Some models don't support
          # fallbacks; on those models, a list of fallback models returns a 400 error. See
          # [Server-side fallback](https://platform.claude.com/docs/en/build-with-claude/refusals-and-fallback#server-side-fallback).
          # The string "default" requests the requested model's server-defined default
          # fallback configuration. On a model that doesn't support fallbacks, the request
          # runs on the requested model alone, so a declined request stays declined.
          fallbacks: nil,
          # Body param: Specifies the geographic region for inference processing. If not
          # specified, the workspace's `default_inference_geo` is used.
          inference_geo: nil,
          # Body param: MCP servers to be utilized in this request
          mcp_servers: nil,
          # Body param: An object describing metadata about the request.
          metadata: nil,
          # Body param: Configuration options for the model's output, such as the output
          # format.
          output_config: nil,
          # Body param: Deprecated: Use `output_config.format` instead. See
          # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
          #
          # A schema to specify Claude's output format in responses. This parameter will be
          # removed in a future release.
          output_format: nil,
          # Body param: Determines whether to use priority capacity (if available) or
          # standard capacity for this request.
          #
          # Anthropic offers different levels of service for your API requests. See
          # [service-tiers](https://platform.claude.com/docs/en/api/service-tiers) for
          # details.
          service_tier: nil,
          # Body param: The inference speed mode for this request. `"fast"` enables high
          # output-tokens-per-second inference.
          #
          # Some models require the `fast-mode-2026-02-01` beta header for any `speed`
          # value. See
          # [fast mode](https://platform.claude.com/docs/en/build-with-claude/fast-mode) for
          # which models.
          speed: nil,
          # Body param: Custom text sequences that will cause the model to stop generating.
          #
          # Our models will normally stop when they have naturally completed their turn,
          # which will result in a response `stop_reason` of `"end_turn"`.
          #
          # If you want the model to stop generating when it encounters custom strings of
          # text, you can use the `stop_sequences` parameter. If the model encounters one of
          # the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
          # and the response `stop_sequence` value will contain the matched stop sequence.
          stop_sequences: nil,
          # Body param: System prompt.
          #
          # A system prompt is a way of providing context and instructions to Claude, such
          # as specifying a particular goal or role. See our
          # [guide to system prompts](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices#give-claude-a-role).
          system_: nil,
          # Body param: Configuration for Claude's thinking.
          #
          # With `{"type": "adaptive"}`, Claude decides when and how much to think. With
          # `{"type": "enabled"}` (manual extended thinking), you set a `budget_tokens` of
          # at least 1,024. Thinking tokens count toward your `max_tokens` limit.
          #
          # Which `type` values are accepted, and what happens when you omit `thinking`,
          # depend on the model. See
          # [thinking](https://platform.claude.com/docs/en/build-with-claude/thinking#configuring-thinking)
          # for each model's behavior.
          thinking: nil,
          # Body param: Server-held conversation state (a Thread). `{"type": "create"}` asks
          # the server to hold this conversation's state under the response's `id`;
          # `{"type": "continue", "previous_message_id": ...}` resumes from a previous
          # response so only the new turn's messages are sent. The response shape is
          # unchanged.
          thread: nil,
          # Body param: How the model should use the provided tools. The model can use a
          # specific tool, any available tool, decide by itself, or not use tools at all.
          tool_choice: nil,
          # Body param: Definitions of tools that the model may use.
          #
          # If you include `tools` in your API request, the model may return `tool_use`
          # content blocks that represent the model's use of those tools. You can then run
          # those tools using the tool input generated by the model and then optionally
          # return results back to the model using `tool_result` content blocks.
          #
          # There are two types of tools: **client tools** and **server tools**. The
          # behavior described below applies to client tools. For
          # [server tools](https://platform.claude.com/docs/en/agents-and-tools/tool-use/server-tools),
          # see their individual documentation as each has its own behavior (e.g., the
          # [web search tool](https://platform.claude.com/docs/en/agents-and-tools/tool-use/web-search-tool)).
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
          # See our
          # [guide](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)
          # for more details.
          tools: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Header param: The user profile ID to attribute this request to. Use when acting
          # on behalf of a party other than your organization.
          user_profile_id: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          # There is no need to provide `stream:`. Instead, use `#stream_raw` or `#create`
          # for streaming and non-streaming use cases, respectively.
          stream: true,
          request_options: {}
        )
        end

        # Count the number of tokens in a Message.
        #
        # The Token Count API can be used to count the number of tokens in a Message,
        # including tools, images, and documents, without creating it.
        #
        # Learn more about token counting in our
        # [user guide](https://platform.claude.com/docs/en/build-with-claude/token-counting)
        sig do
          params(
            messages:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaUserMessageParam::OrHash,
                  Anthropic::Beta::BetaAssistantMessageParam::OrHash,
                  Anthropic::Beta::BetaSystemMessageParam::OrHash
                )
              ],
            model: T.any(Anthropic::Model::OrSymbol, String),
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            compaction:
              T.nilable(Anthropic::Beta::BetaCompactionConfig::OrHash),
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementConfig::OrHash),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaRequestMCPServerURLDefinition::OrHash
              ],
            output_config: Anthropic::Beta::BetaOutputConfig::OrHash,
            output_format:
              T.nilable(Anthropic::Beta::BetaJSONOutputFormat::OrHash),
            speed:
              T.nilable(
                Anthropic::Beta::MessageCountTokensParams::Speed::OrSymbol
              ),
            system_:
              Anthropic::Beta::MessageCountTokensParams::System::Variants,
            thinking:
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigDisabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigBetweenTools::OrHash,
                Anthropic::Beta::BetaThinkingConfigAdaptive::OrHash
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
                  Anthropic::Beta::BetaCodeExecutionTool20260120::OrHash,
                  Anthropic::Beta::BetaCodeExecutionTool20260521::OrHash,
                  Anthropic::Beta::BetaBrowserToolset20260801::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20241022::OrHash,
                  Anthropic::Beta::BetaMemoryTool20250818::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20241022::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20251124::OrHash,
                  Anthropic::Beta::BetaComputerToolset20260801::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250429::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250728::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20250305::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20250910::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20260209::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260209::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260309::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20260318::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260318::OrHash,
                  Anthropic::Beta::BetaAdvisorTool20260301::OrHash,
                  Anthropic::Beta::BetaToolSearchToolBm25_20251119::OrHash,
                  Anthropic::Beta::BetaToolSearchToolRegex20251119::OrHash,
                  Anthropic::Beta::BetaMCPToolset::OrHash
                )
              ],
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            user_profile_id: String,
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Beta::BetaMessageTokensCount)
        end
        def count_tokens(
          # Body param: Input messages.
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
          # constrain part of the model's response. This is called prefill. On models that
          # don't support prefill, creating a message that ends with a partial `assistant`
          # response returns a 400 error. See
          # [Prefill not supported](https://platform.claude.com/docs/en/api/errors#prefill-not-supported).
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
          # Example with a partially-filled response from Claude, for models that support
          # prefill:
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
          # See
          # [input examples](https://platform.claude.com/docs/en/build-with-claude/working-with-messages).
          #
          # Note that if you want to include a
          # [system prompt](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices#give-claude-a-role),
          # you can use the top-level `system` parameter.
          #
          # There is a limit of 100,000 messages in a single request.
          messages:,
          # Body param: The model that will complete your prompt.
          #
          # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          model:,
          # Body param: Top-level cache control automatically applies a cache_control marker
          # to the last cacheable block in the request.
          cache_control: nil,
          # Body param: Compaction configuration.
          #
          # When set on `POST /v1/messages`, the request is a compaction request: the
          # conversation in `messages` is summarized and the response holds only the
          # resulting `compaction` block (`stop_reason` `"compaction"`), which later
          # requests send first in `messages` in place of the messages it summarizes.
          # `POST /v1/messages/count_tokens` accepts this parameter and ignores it: the
          # count it returns is for the conversation in `messages` as sent. Cannot be
          # combined with `context_management`.
          compaction: nil,
          # Body param: Context management configuration.
          #
          # This allows you to control how Claude manages context across multiple requests,
          # such as whether to clear function results or not.
          context_management: nil,
          # Body param: MCP servers to be utilized in this request
          mcp_servers: nil,
          # Body param: Configuration options for the model's output, such as the output
          # format.
          output_config: nil,
          # Body param: Deprecated: Use `output_config.format` instead. See
          # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
          #
          # A schema to specify Claude's output format in responses. This parameter will be
          # removed in a future release.
          output_format: nil,
          # Body param: The inference speed mode for this request. `"fast"` enables high
          # output-tokens-per-second inference.
          #
          # Some models require the `fast-mode-2026-02-01` beta header for any `speed`
          # value. See
          # [fast mode](https://platform.claude.com/docs/en/build-with-claude/fast-mode) for
          # which models.
          speed: nil,
          # Body param: System prompt.
          #
          # A system prompt is a way of providing context and instructions to Claude, such
          # as specifying a particular goal or role. See our
          # [guide to system prompts](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices#give-claude-a-role).
          system_: nil,
          # Body param: Configuration for Claude's thinking.
          #
          # With `{"type": "adaptive"}`, Claude decides when and how much to think. With
          # `{"type": "enabled"}` (manual extended thinking), you set a `budget_tokens` of
          # at least 1,024. Thinking tokens count toward your `max_tokens` limit.
          #
          # Which `type` values are accepted, and what happens when you omit `thinking`,
          # depend on the model. See
          # [thinking](https://platform.claude.com/docs/en/build-with-claude/thinking#configuring-thinking)
          # for each model's behavior.
          thinking: nil,
          # Body param: How the model should use the provided tools. The model can use a
          # specific tool, any available tool, decide by itself, or not use tools at all.
          tool_choice: nil,
          # Body param: Definitions of tools that the model may use.
          #
          # If you include `tools` in your API request, the model may return `tool_use`
          # content blocks that represent the model's use of those tools. You can then run
          # those tools using the tool input generated by the model and then optionally
          # return results back to the model using `tool_result` content blocks.
          #
          # There are two types of tools: **client tools** and **server tools**. The
          # behavior described below applies to client tools. For
          # [server tools](https://platform.claude.com/docs/en/agents-and-tools/tool-use/server-tools),
          # see their individual documentation as each has its own behavior (e.g., the
          # [web search tool](https://platform.claude.com/docs/en/agents-and-tools/tool-use/web-search-tool)).
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
          # See our
          # [guide](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)
          # for more details.
          tools: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Header param: The user profile ID to attribute this request to. Use when acting
          # on behalf of a party other than your organization.
          user_profile_id: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # Streams a message like `stream_raw` and returns a MessageStream, which
        # accumulates the streamed events and parses tool inputs and structured output.
        sig do
          params(
            max_tokens: Integer,
            messages:
              T::Array[
                T.any(
                  Anthropic::Beta::BetaUserMessageParam::OrHash,
                  Anthropic::Beta::BetaAssistantMessageParam::OrHash,
                  Anthropic::Beta::BetaSystemMessageParam::OrHash
                )
              ],
            model: T.any(Anthropic::Model::OrSymbol, String),
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            compaction:
              T.nilable(Anthropic::Beta::BetaCompactionConfig::OrHash),
            container:
              T.nilable(
                T.any(Anthropic::Beta::BetaContainerParams::OrHash, String)
              ),
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementConfig::OrHash),
            diagnostics:
              T.nilable(Anthropic::Beta::BetaDiagnosticsParam::OrHash),
            fallback_credit_token:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaFallbackCreditTokenParam::OrHash,
                  String
                )
              ),
            fallbacks:
              T.nilable(
                T.any(
                  Symbol,
                  T::Array[Anthropic::Beta::BetaFallbackParam::OrHash]
                )
              ),
            inference_geo: T.nilable(String),
            mcp_servers:
              T::Array[
                Anthropic::Beta::BetaRequestMCPServerURLDefinition::OrHash
              ],
            metadata: Anthropic::Beta::BetaMetadata::OrHash,
            output_config: Anthropic::Beta::BetaOutputConfig::OrHash,
            output_format:
              T.nilable(Anthropic::Beta::BetaJSONOutputFormat::OrHash),
            service_tier:
              Anthropic::Beta::MessageCreateParams::ServiceTier::OrSymbol,
            speed:
              T.nilable(Anthropic::Beta::MessageCreateParams::Speed::OrSymbol),
            stop_sequences: T::Array[String],
            system_: Anthropic::Beta::MessageCreateParams::System::Variants,
            thinking:
              T.any(
                Anthropic::Beta::BetaThinkingConfigEnabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigDisabled::OrHash,
                Anthropic::Beta::BetaThinkingConfigBetweenTools::OrHash,
                Anthropic::Beta::BetaThinkingConfigAdaptive::OrHash
              ),
            thread:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaThreadCreateParams::OrHash,
                  Anthropic::Beta::BetaThreadContinueParams::OrHash
                )
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
                  Anthropic::Beta::BetaCodeExecutionTool20260120::OrHash,
                  Anthropic::Beta::BetaCodeExecutionTool20260521::OrHash,
                  Anthropic::Beta::BetaBrowserToolset20260801::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20241022::OrHash,
                  Anthropic::Beta::BetaMemoryTool20250818::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20241022::OrHash,
                  Anthropic::Beta::BetaToolComputerUse20251124::OrHash,
                  Anthropic::Beta::BetaComputerToolset20260801::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250124::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250429::OrHash,
                  Anthropic::Beta::BetaToolTextEditor20250728::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20250305::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20250910::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20260209::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260209::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260309::OrHash,
                  Anthropic::Beta::BetaWebSearchTool20260318::OrHash,
                  Anthropic::Beta::BetaWebFetchTool20260318::OrHash,
                  Anthropic::Beta::BetaAdvisorTool20260301::OrHash,
                  Anthropic::Beta::BetaToolSearchToolBm25_20251119::OrHash,
                  Anthropic::Beta::BetaToolSearchToolRegex20251119::OrHash,
                  Anthropic::Beta::BetaMCPToolset::OrHash
                )
              ],
            betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
            user_profile_id: String,
            workspace_id: String,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(Anthropic::Helpers::Streaming::MessageStream)
        end
        def stream(
          # Body param: The maximum number of tokens to generate before stopping.
          #
          # Note that our models may stop _before_ reaching this maximum. This parameter
          # only specifies the absolute maximum number of tokens to generate.
          #
          # Set to `0` to populate the
          # [prompt cache](https://platform.claude.com/docs/en/build-with-claude/prompt-caching#pre-warming-the-cache)
          # without generating a response.
          #
          # Different models have different maximum values for this parameter. See
          # [models](https://platform.claude.com/docs/en/about-claude/models/overview) for
          # details.
          max_tokens:,
          # Body param: Input messages.
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
          # constrain part of the model's response. This is called prefill. On models that
          # don't support prefill, creating a message that ends with a partial `assistant`
          # response returns a 400 error. See
          # [Prefill not supported](https://platform.claude.com/docs/en/api/errors#prefill-not-supported).
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
          # Example with a partially-filled response from Claude, for models that support
          # prefill:
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
          # See
          # [input examples](https://platform.claude.com/docs/en/build-with-claude/working-with-messages).
          #
          # Note that if you want to include a
          # [system prompt](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices#give-claude-a-role),
          # you can use the top-level `system` parameter.
          #
          # There is a limit of 100,000 messages in a single request.
          messages:,
          # Body param: The model that will complete your prompt.
          #
          # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          model:,
          # Body param: Top-level cache control automatically applies a cache_control marker
          # to the last cacheable block in the request.
          cache_control: nil,
          # Body param: Compaction configuration.
          #
          # When set on `POST /v1/messages`, the request is a compaction request: the
          # conversation in `messages` is summarized and the response holds only the
          # resulting `compaction` block (`stop_reason` `"compaction"`), which later
          # requests send first in `messages` in place of the messages it summarizes.
          # `POST /v1/messages/count_tokens` accepts this parameter and ignores it: the
          # count it returns is for the conversation in `messages` as sent. Cannot be
          # combined with `context_management`.
          compaction: nil,
          # Body param: Container identifier for reuse across requests.
          container: nil,
          # Body param: Context management configuration.
          #
          # This allows you to control how Claude manages context across multiple requests,
          # such as whether to clear function results or not.
          context_management: nil,
          # Body param: Request-level diagnostics. Supply `previous_message_id` to have the
          # response include `diagnostics.cache_miss_reason` explaining any prompt-cache
          # divergence from that prior request.
          diagnostics: nil,
          # Body param: The `fallback_credit_token` from a prior refusal's `stop_details`.
          #
          # When a preceding request was refused and returned a `fallback_credit_token`,
          # pass that code here on the retry to have the retry's cache-creation tokens for
          # the prefix that was warm on the refused model billed at the cache-read rate.
          # Must be redeemed by the same organization and workspace, with the same request
          # body (optionally extended by one appended `assistant` message whose content is
          # the partial text — with any trailing whitespace stripped from the final text
          # block — and paired server-tool blocks streamed before the refusal; the
          # appended-assistant form is not available for requests with `output_format` set
          # or forced `tool_choice`), on an eligible fallback model, on the same platform,
          # and within 5 minutes of the refusal; a mismatch is a 400. A token minted
          # mid-server-tool-loop whose partial content was continuable may only be redeemed
          # with the appended-assistant form — if an exact-body retry is rejected with a 400
          # saying the token must be redeemed by continuing the partial response, retry with
          # the appended-assistant form instead.
          #
          # When the appended-assistant form is used on a model that otherwise disallows
          # assistant-turn prefill, this token also authorizes that one prefill.
          fallback_credit_token: nil,
          # Body param: Opt-in server-side retry on one or more substitute models when the
          # requested model declines for policy reasons. Tried in order: if the first entry
          # also declines, the second is tried, and so on. Some models don't support
          # fallbacks; on those models, a list of fallback models returns a 400 error. See
          # [Server-side fallback](https://platform.claude.com/docs/en/build-with-claude/refusals-and-fallback#server-side-fallback).
          # The string "default" requests the requested model's server-defined default
          # fallback configuration. On a model that doesn't support fallbacks, the request
          # runs on the requested model alone, so a declined request stays declined.
          fallbacks: nil,
          # Body param: Specifies the geographic region for inference processing. If not
          # specified, the workspace's `default_inference_geo` is used.
          inference_geo: nil,
          # Body param: MCP servers to be utilized in this request
          mcp_servers: nil,
          # Body param: An object describing metadata about the request.
          metadata: nil,
          # Body param: Configuration options for the model's output, such as the output
          # format.
          output_config: nil,
          # Body param: Deprecated: Use `output_config.format` instead. See
          # [structured outputs](https://platform.claude.com/docs/en/build-with-claude/structured-outputs)
          #
          # A schema to specify Claude's output format in responses. This parameter will be
          # removed in a future release.
          output_format: nil,
          # Body param: Determines whether to use priority capacity (if available) or
          # standard capacity for this request.
          #
          # Anthropic offers different levels of service for your API requests. See
          # [service-tiers](https://platform.claude.com/docs/en/api/service-tiers) for
          # details.
          service_tier: nil,
          # Body param: The inference speed mode for this request. `"fast"` enables high
          # output-tokens-per-second inference.
          #
          # Some models require the `fast-mode-2026-02-01` beta header for any `speed`
          # value. See
          # [fast mode](https://platform.claude.com/docs/en/build-with-claude/fast-mode) for
          # which models.
          speed: nil,
          # Body param: Custom text sequences that will cause the model to stop generating.
          #
          # Our models will normally stop when they have naturally completed their turn,
          # which will result in a response `stop_reason` of `"end_turn"`.
          #
          # If you want the model to stop generating when it encounters custom strings of
          # text, you can use the `stop_sequences` parameter. If the model encounters one of
          # the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
          # and the response `stop_sequence` value will contain the matched stop sequence.
          stop_sequences: nil,
          # Body param: System prompt.
          #
          # A system prompt is a way of providing context and instructions to Claude, such
          # as specifying a particular goal or role. See our
          # [guide to system prompts](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices#give-claude-a-role).
          system_: nil,
          # Body param: Configuration for Claude's thinking.
          #
          # With `{"type": "adaptive"}`, Claude decides when and how much to think. With
          # `{"type": "enabled"}` (manual extended thinking), you set a `budget_tokens` of
          # at least 1,024. Thinking tokens count toward your `max_tokens` limit.
          #
          # Which `type` values are accepted, and what happens when you omit `thinking`,
          # depend on the model. See
          # [thinking](https://platform.claude.com/docs/en/build-with-claude/thinking#configuring-thinking)
          # for each model's behavior.
          thinking: nil,
          # Body param: Server-held conversation state (a Thread). `{"type": "create"}` asks
          # the server to hold this conversation's state under the response's `id`;
          # `{"type": "continue", "previous_message_id": ...}` resumes from a previous
          # response so only the new turn's messages are sent. The response shape is
          # unchanged.
          thread: nil,
          # Body param: How the model should use the provided tools. The model can use a
          # specific tool, any available tool, decide by itself, or not use tools at all.
          tool_choice: nil,
          # Body param: Definitions of tools that the model may use.
          #
          # If you include `tools` in your API request, the model may return `tool_use`
          # content blocks that represent the model's use of those tools. You can then run
          # those tools using the tool input generated by the model and then optionally
          # return results back to the model using `tool_result` content blocks.
          #
          # There are two types of tools: **client tools** and **server tools**. The
          # behavior described below applies to client tools. For
          # [server tools](https://platform.claude.com/docs/en/agents-and-tools/tool-use/server-tools),
          # see their individual documentation as each has its own behavior (e.g., the
          # [web search tool](https://platform.claude.com/docs/en/agents-and-tools/tool-use/web-search-tool)).
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
          # See our
          # [guide](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)
          # for more details.
          tools: nil,
          # Header param: Optional header to specify the beta version(s) you want to use.
          betas: nil,
          # Header param: The user profile ID to attribute this request to. Use when acting
          # on behalf of a party other than your organization.
          user_profile_id: nil,
          # Header param: Optional header to select the Workspace for this request. The
          # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
          #
          # Only needed for credentials that can act on more than one Workspace. A
          # credential that belongs to a specific Workspace may omit it; if sent, it must
          # match that Workspace.
          workspace_id: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
