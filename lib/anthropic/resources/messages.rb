# frozen_string_literal: true

module Anthropic
  module Resources
    class Messages
      MODELS_TO_WARN_WITH_THINKING_ENABLED = ["claude-opus-4-6", "claude-mythos-preview"].freeze

      # @return [Anthropic::Resources::Messages::Batches]
      attr_reader :batches

      # See {Anthropic::Resources::Messages#stream} for streaming counterpart.
      #
      # Send a structured list of input messages with text and/or image content, and the
      # model will generate the next message in the conversation.
      #
      # The Messages API can be used for either single queries or stateless multi-turn
      # conversations.
      #
      # Learn more about the Messages API in our
      # [user guide](https://platform.claude.com/docs/en/get-started)
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::MessageCreateParams} for more details.
      #
      # @overload create(max_tokens:, messages:, model:, cache_control: nil, container: nil, diagnostics: nil, inference_geo: nil, metadata: nil, output_config: nil, service_tier: nil, speed: nil, stop_sequences: nil, system_: nil, thinking: nil, tool_choice: nil, tools: nil, user_profile_id: nil, workspace_id: nil, request_options: {})
      #
      # @param max_tokens [Integer] Body param: The maximum number of tokens to generate before stopping.
      #
      # @param messages [Array<Anthropic::Models::UserMessageParam, Anthropic::Models::AssistantMessageParam, Anthropic::Models::SystemMessageParam>] Body param: Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] Body param: The model that will complete your prompt.
      #
      # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Body param: Top-level cache control automatically applies a cache_control marker
      #
      # @param container [Anthropic::Models::ContainerParams, String, nil] Body param: Container identifier for reuse across requests.
      #
      # @param diagnostics [Anthropic::Models::DiagnosticsParam, nil] Body param: Request-level diagnostics. Supply `previous_message_id` to have the
      #
      # @param inference_geo [String, nil] Body param: Specifies the geographic region for inference processing. If not spe
      #
      # @param metadata [Anthropic::Models::Metadata] Body param: An object describing metadata about the request.
      #
      # @param output_config [Anthropic::Models::OutputConfig] Body param: Configuration options for the model's output, such as the output for
      #
      # @param service_tier [Symbol, Anthropic::Models::MessageCreateParams::ServiceTier] Body param: Determines whether to use priority capacity (if available) or standa
      #
      # @param speed [Symbol, Anthropic::Models::MessageCreateParams::Speed, nil] Body param: The inference speed mode for this request. `"fast"` enables high out
      #
      # @param stop_sequences [Array<String>] Body param: Custom text sequences that will cause the model to stop generating.
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] Body param: System prompt.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigBetweenTools, Anthropic::Models::ThinkingConfigAdaptive] Body param: Configuration for Claude's thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::CodeExecutionTool20260120, Anthropic::Models::CodeExecutionTool20260521, Anthropic::Models::BrowserToolset20260801, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ComputerToolset20260801, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::WebSearchTool20260209, Anthropic::Models::WebFetchTool20260209, Anthropic::Models::WebFetchTool20260309, Anthropic::Models::WebSearchTool20260318, Anthropic::Models::WebFetchTool20260318, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119>] Body param: Definitions of tools that the model may use.
      #
      # @param user_profile_id [String] Header param: The user profile ID to attribute this request to. Use when acting
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @raise [Anthropic::Models::AvailableToolsLimitExceededError] The tools available after a message exceed a limit on their number or their
      #   size.
      # @raise [Anthropic::Models::ClaudeCodeKeyCreatorNotMemberError] The API key belongs to the Claude Code workspace, and the user who created it is
      #   no longer a member of the organization or of that workspace.
      # @raise [Anthropic::Models::ClaudeCodeVersionTooOldError] The request comes from a Claude Code version older than the minimum that the
      #   requested model or the organization requires. Update Claude Code, then retry.
      # @raise [Anthropic::Models::CMEKKeyDisabledError] The workspace's customer-managed encryption key is disabled or revoked.
      #   Re-enable the key, then retry.
      # @raise [Anthropic::Models::CMEKKeyNetworkBlockedError] The key management service's network access controls blocked the request to the
      #   workspace's customer-managed encryption key. The key itself may be healthy.
      # @raise [Anthropic::Models::CompactionBlockAmbiguousError] `messages` holds more than one `compaction` block with content. Send only the
      #   block the conversation returned last.
      # @raise [Anthropic::Models::CompactionBlockMisplacedError] The `compaction` block is not the first block of the conversation, or is in a
      #   `system` message.
      # @raise [Anthropic::Models::CompactionContentMismatchError] The `compaction` block's `content` differs from the text its `signature`
      #   recorded.
      # @raise [Anthropic::Models::CompactionIncompleteTurnError] The compaction request ends on an `assistant` turn that is not finished.
      # @raise [Anthropic::Models::CompactionNothingToSummarizeError] `messages` holds no `user` or `assistant` content to summarize or adopt.
      # @raise [Anthropic::Models::CompactionSignatureInvalidError] The `compaction` block's `signature` does not verify.
      # @raise [Anthropic::Models::CompactionTooManyToolReferencesError] The conversation references more distinct tools than a `compaction` block can
      #   record.
      # @raise [Anthropic::Models::CompactionToolChangesMismatchError] The `compaction` block's `tool_changes` differs from what was returned with the
      #   block.
      # @raise [Anthropic::Models::OrganizationOnHoldError] Anthropic has disabled the organization for trust and safety reasons. An
      #   organization disabled for any other reason, such as billing, does not get this
      #   code. `appeal_url`, when present, is where the organization can appeal.
      # @raise [Anthropic::Models::RequestBodyEncodingInvalidError] The request body is not valid for its `Content-Encoding`.
      # @raise [Anthropic::Models::RequestBodyEncodingUnsupportedError] The request's `Content-Encoding` is not supported.
      # @raise [Anthropic::Models::ThreadAlreadyContinuedError] The response that `previous_message_id` names has already been continued, and
      #   each response can be continued only once. Continue from the Thread's most recent
      #   response `id`.
      # @raise [Anthropic::Models::ThreadContinueInFlightError] Another request is still continuing from the same `previous_message_id`. Wait
      #   for it to complete and continue from its response `id`, or replay the full
      #   conversation with `thread: {"type": "create"}`.
      # @raise [Anthropic::Models::ThreadFingerprintMismatchError] A field that must stay the same across a Thread's turns differs from the value
      #   stored with the Thread; the message names each such field. Send the stored
      #   values, or replay the full conversation with `thread: {"type": "create"}` to
      #   change them.
      # @raise [Anthropic::Models::ThreadUnsupportedRequestError] The request combines `thread` with a request field or an organization setting
      #   that Threads do not support; `unsupported`, when present, names it. Send the
      #   full conversation without `thread`, or change that field.
      # @raise [Anthropic::Models::ToolNameConflictError] A tool made available in `messages` takes a name that an available tool of
      #   another kind, or of another MCP server, already holds.
      # @raise [Anthropic::Models::ToolReferenceUnresolvedError] A tool change or MCP tool listing references a tool or MCP server that is not
      #   defined at that position in the conversation.
      # @raise [Anthropic::Models::ThreadNotFoundError] No usable Thread state was found for `previous_message_id`. Replay the full
      #   conversation with `thread: {"type": "create"}` to start a new Thread.
      # @raise [Anthropic::Models::SkillReadBlockedUndecryptableError] A custom skill the request names is stored under an encryption key state the
      #   workspace cannot currently decrypt.
      # @raise [Anthropic::Models::RequestBodyTooLargeAfterDecodingError] The compressed request body exceeds the request size limit once decoded.
      # @raise [Anthropic::Models::EnforcedSpendLimitReachedError] The organization has crossed the monthly API usage threshold of its API tier.
      # @raise [Anthropic::Models::CMEKKeyUnreachableError] The workspace's customer-managed encryption key could not be reached. Retry the
      #   request; if this continues, check that the key is available in your key
      #   management service, or contact Anthropic support.
      # @raise [Anthropic::Models::CompactionUnavailableError] The compaction could not be completed for a transient server reason. Retry the
      #   request.
      #
      # @return [Anthropic::Models::Message]
      #
      # @see Anthropic::Models::MessageCreateParams
      def create(params)
        parsed, options = Anthropic::MessageCreateParams.dump_request(params)
        if parsed[:stream]
          message = "Please use `#stream` for the streaming use case."
          raise ArgumentError.new(message)
        end

        warn_thinking_enabled(parsed)

        tools, models = Anthropic::Helpers::Messages.distill_input_schema_models!(parsed, strict: nil)

        unwrap = ->(raw) { Anthropic::Helpers::Messages.parse_input_schemas!(raw, tools:, models:) }

        if options.empty? && !@client.timeout_overridden?
          model = parsed[:model]&.to_sym
          max_tokens = parsed[:max_tokens].to_i
          timeout = @client.calculate_nonstreaming_timeout(
            max_tokens,
            Anthropic::Client::MODEL_NONSTREAMING_TOKENS[model]
          )
          options = {timeout: timeout}
        end

        header_params = {user_profile_id: "anthropic-user-profile-id", workspace_id: "anthropic-workspace-id"}
        @client.request(
          span_name: Anthropic::Internal::Tracing::SpanName::MESSAGES_CREATE,
          span_route: "/v1/messages",
          method: :post,
          path: "v1/messages",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Anthropic::Message,
          unwrap: unwrap,
          options: options
        )
      end

      alias_method :parse, :create

      # See {Anthropic::Resources::Messages#create} for non-streaming counterpart.
      #
      # Send a structured list of input messages with text and/or image content, and the
      # model will generate the next message in the conversation.
      #
      # The Messages API can be used for either single queries or stateless multi-turn
      # conversations.
      #
      # Learn more about the Messages API in our
      # [user guide](https://platform.claude.com/docs/en/get-started)
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::MessageCreateParams} for more details.
      #
      # @overload stream_raw(max_tokens:, messages:, model:, cache_control: nil, container: nil, diagnostics: nil, inference_geo: nil, metadata: nil, output_config: nil, service_tier: nil, speed: nil, stop_sequences: nil, system_: nil, thinking: nil, tool_choice: nil, tools: nil, user_profile_id: nil, workspace_id: nil, request_options: {})
      #
      # @param max_tokens [Integer] Body param: The maximum number of tokens to generate before stopping.
      #
      # @param messages [Array<Anthropic::Models::UserMessageParam, Anthropic::Models::AssistantMessageParam, Anthropic::Models::SystemMessageParam>] Body param: Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] Body param: The model that will complete your prompt.
      #
      # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Body param: Top-level cache control automatically applies a cache_control marker
      #
      # @param container [Anthropic::Models::ContainerParams, String, nil] Body param: Container identifier for reuse across requests.
      #
      # @param diagnostics [Anthropic::Models::DiagnosticsParam, nil] Body param: Request-level diagnostics. Supply `previous_message_id` to have the
      #
      # @param inference_geo [String, nil] Body param: Specifies the geographic region for inference processing. If not spe
      #
      # @param metadata [Anthropic::Models::Metadata] Body param: An object describing metadata about the request.
      #
      # @param output_config [Anthropic::Models::OutputConfig] Body param: Configuration options for the model's output, such as the output for
      #
      # @param service_tier [Symbol, Anthropic::Models::MessageCreateParams::ServiceTier] Body param: Determines whether to use priority capacity (if available) or standa
      #
      # @param speed [Symbol, Anthropic::Models::MessageCreateParams::Speed, nil] Body param: The inference speed mode for this request. `"fast"` enables high out
      #
      # @param stop_sequences [Array<String>] Body param: Custom text sequences that will cause the model to stop generating.
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] Body param: System prompt.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigBetweenTools, Anthropic::Models::ThinkingConfigAdaptive] Body param: Configuration for Claude's thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::CodeExecutionTool20260120, Anthropic::Models::CodeExecutionTool20260521, Anthropic::Models::BrowserToolset20260801, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ComputerToolset20260801, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::WebSearchTool20260209, Anthropic::Models::WebFetchTool20260209, Anthropic::Models::WebFetchTool20260309, Anthropic::Models::WebSearchTool20260318, Anthropic::Models::WebFetchTool20260318, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119>] Body param: Definitions of tools that the model may use.
      #
      # @param user_profile_id [String] Header param: The user profile ID to attribute this request to. Use when acting
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @raise [Anthropic::Models::AvailableToolsLimitExceededError] The tools available after a message exceed a limit on their number or their
      #   size.
      # @raise [Anthropic::Models::ClaudeCodeKeyCreatorNotMemberError] The API key belongs to the Claude Code workspace, and the user who created it is
      #   no longer a member of the organization or of that workspace.
      # @raise [Anthropic::Models::ClaudeCodeVersionTooOldError] The request comes from a Claude Code version older than the minimum that the
      #   requested model or the organization requires. Update Claude Code, then retry.
      # @raise [Anthropic::Models::CMEKKeyDisabledError] The workspace's customer-managed encryption key is disabled or revoked.
      #   Re-enable the key, then retry.
      # @raise [Anthropic::Models::CMEKKeyNetworkBlockedError] The key management service's network access controls blocked the request to the
      #   workspace's customer-managed encryption key. The key itself may be healthy.
      # @raise [Anthropic::Models::CompactionBlockAmbiguousError] `messages` holds more than one `compaction` block with content. Send only the
      #   block the conversation returned last.
      # @raise [Anthropic::Models::CompactionBlockMisplacedError] The `compaction` block is not the first block of the conversation, or is in a
      #   `system` message.
      # @raise [Anthropic::Models::CompactionContentMismatchError] The `compaction` block's `content` differs from the text its `signature`
      #   recorded.
      # @raise [Anthropic::Models::CompactionIncompleteTurnError] The compaction request ends on an `assistant` turn that is not finished.
      # @raise [Anthropic::Models::CompactionNothingToSummarizeError] `messages` holds no `user` or `assistant` content to summarize or adopt.
      # @raise [Anthropic::Models::CompactionSignatureInvalidError] The `compaction` block's `signature` does not verify.
      # @raise [Anthropic::Models::CompactionTooManyToolReferencesError] The conversation references more distinct tools than a `compaction` block can
      #   record.
      # @raise [Anthropic::Models::CompactionToolChangesMismatchError] The `compaction` block's `tool_changes` differs from what was returned with the
      #   block.
      # @raise [Anthropic::Models::OrganizationOnHoldError] Anthropic has disabled the organization for trust and safety reasons. An
      #   organization disabled for any other reason, such as billing, does not get this
      #   code. `appeal_url`, when present, is where the organization can appeal.
      # @raise [Anthropic::Models::RequestBodyEncodingInvalidError] The request body is not valid for its `Content-Encoding`.
      # @raise [Anthropic::Models::RequestBodyEncodingUnsupportedError] The request's `Content-Encoding` is not supported.
      # @raise [Anthropic::Models::ThreadAlreadyContinuedError] The response that `previous_message_id` names has already been continued, and
      #   each response can be continued only once. Continue from the Thread's most recent
      #   response `id`.
      # @raise [Anthropic::Models::ThreadContinueInFlightError] Another request is still continuing from the same `previous_message_id`. Wait
      #   for it to complete and continue from its response `id`, or replay the full
      #   conversation with `thread: {"type": "create"}`.
      # @raise [Anthropic::Models::ThreadFingerprintMismatchError] A field that must stay the same across a Thread's turns differs from the value
      #   stored with the Thread; the message names each such field. Send the stored
      #   values, or replay the full conversation with `thread: {"type": "create"}` to
      #   change them.
      # @raise [Anthropic::Models::ThreadUnsupportedRequestError] The request combines `thread` with a request field or an organization setting
      #   that Threads do not support; `unsupported`, when present, names it. Send the
      #   full conversation without `thread`, or change that field.
      # @raise [Anthropic::Models::ToolNameConflictError] A tool made available in `messages` takes a name that an available tool of
      #   another kind, or of another MCP server, already holds.
      # @raise [Anthropic::Models::ToolReferenceUnresolvedError] A tool change or MCP tool listing references a tool or MCP server that is not
      #   defined at that position in the conversation.
      # @raise [Anthropic::Models::ThreadNotFoundError] No usable Thread state was found for `previous_message_id`. Replay the full
      #   conversation with `thread: {"type": "create"}` to start a new Thread.
      # @raise [Anthropic::Models::SkillReadBlockedUndecryptableError] A custom skill the request names is stored under an encryption key state the
      #   workspace cannot currently decrypt.
      # @raise [Anthropic::Models::RequestBodyTooLargeAfterDecodingError] The compressed request body exceeds the request size limit once decoded.
      # @raise [Anthropic::Models::EnforcedSpendLimitReachedError] The organization has crossed the monthly API usage threshold of its API tier.
      # @raise [Anthropic::Models::CMEKKeyUnreachableError] The workspace's customer-managed encryption key could not be reached. Retry the
      #   request; if this continues, check that the key is available in your key
      #   management service, or contact Anthropic support.
      # @raise [Anthropic::Models::CompactionUnavailableError] The compaction could not be completed for a transient server reason. Retry the
      #   request.
      #
      # @return [Anthropic::Internal::Type::BaseStream<Anthropic::Models::RawMessageStartEvent, Anthropic::Models::RawMessageDeltaEvent, Anthropic::Models::RawMessageStopEvent, Anthropic::Models::RawContentBlockStartEvent, Anthropic::Models::RawContentBlockDeltaEvent, Anthropic::Models::RawContentBlockStopEvent>]
      #
      # @see Anthropic::Models::MessageCreateParams
      def stream_raw(params)
        parsed, options = Anthropic::MessageCreateParams.dump_request(params)
        unless parsed.fetch(:stream, true)
          message = "Please use `#create` for the non-streaming use case."
          raise ArgumentError.new(message)
        end
        parsed.store(:stream, true)
        Anthropic::Helpers::Messages.distill_input_schema_models!(parsed, strict: nil)

        header_params = {user_profile_id: "anthropic-user-profile-id", workspace_id: "anthropic-workspace-id"}
        @client.request(
          span_name: Anthropic::Internal::Tracing::SpanName::MESSAGES_CREATE,
          span_route: "/v1/messages",
          method: :post,
          path: "v1/messages",
          headers: stream_headers(
            "accept" => "text/event-stream",
            "accept-encoding" => "identity",
            **parsed.slice(*header_params.keys)
          ).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          stream: Anthropic::Internal::Stream,
          model: Anthropic::RawMessageStreamEvent,
          options: {timeout: (@client.timeout_overridden? ? @client.timeout : 600), **options}
        )
      end

      # Count the number of tokens in a Message.
      #
      # The Token Count API can be used to count the number of tokens in a Message,
      # including tools, images, and documents, without creating it.
      #
      # Learn more about token counting in our
      # [user guide](https://platform.claude.com/docs/en/build-with-claude/token-counting)
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::MessageCountTokensParams} for more details.
      #
      # @overload count_tokens(messages:, model:, cache_control: nil, output_config: nil, speed: nil, system_: nil, thinking: nil, tool_choice: nil, tools: nil, user_profile_id: nil, workspace_id: nil, request_options: {})
      #
      # @param messages [Array<Anthropic::Models::UserMessageParam, Anthropic::Models::AssistantMessageParam, Anthropic::Models::SystemMessageParam>] Body param: Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] Body param: The model that will complete your prompt.
      #
      # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Body param: Top-level cache control automatically applies a cache_control marker
      #
      # @param output_config [Anthropic::Models::OutputConfig] Body param: Configuration options for the model's output, such as the output for
      #
      # @param speed [Symbol, Anthropic::Models::MessageCountTokensParams::Speed, nil] Body param: The inference speed mode for this request. `"fast"` enables high out
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] Body param: System prompt.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigBetweenTools, Anthropic::Models::ThinkingConfigAdaptive] Body param: Configuration for Claude's thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::CodeExecutionTool20260120, Anthropic::Models::CodeExecutionTool20260521, Anthropic::Models::BrowserToolset20260801, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ComputerToolset20260801, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::WebSearchTool20260209, Anthropic::Models::WebFetchTool20260209, Anthropic::Models::WebFetchTool20260309, Anthropic::Models::WebSearchTool20260318, Anthropic::Models::WebFetchTool20260318, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119>] Body param: Definitions of tools that the model may use.
      #
      # @param user_profile_id [String] Header param: The user profile ID to attribute this request to. Use when acting
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @raise [Anthropic::Models::AvailableToolsLimitExceededError] The tools available after a message exceed a limit on their number or their
      #   size.
      # @raise [Anthropic::Models::ClaudeCodeKeyCreatorNotMemberError] The API key belongs to the Claude Code workspace, and the user who created it is
      #   no longer a member of the organization or of that workspace.
      # @raise [Anthropic::Models::CompactionBlockAmbiguousError] `messages` holds more than one `compaction` block with content. Send only the
      #   block the conversation returned last.
      # @raise [Anthropic::Models::CompactionBlockMisplacedError] The `compaction` block is not the first block of the conversation, or is in a
      #   `system` message.
      # @raise [Anthropic::Models::CompactionContentMismatchError] The `compaction` block's `content` differs from the text its `signature`
      #   recorded.
      # @raise [Anthropic::Models::CompactionNothingToSummarizeError] `messages` holds no `user` or `assistant` content to summarize or adopt.
      # @raise [Anthropic::Models::CompactionSignatureInvalidError] The `compaction` block's `signature` does not verify.
      # @raise [Anthropic::Models::CompactionToolChangesMismatchError] The `compaction` block's `tool_changes` differs from what was returned with the
      #   block.
      # @raise [Anthropic::Models::OrganizationOnHoldError] Anthropic has disabled the organization for trust and safety reasons. An
      #   organization disabled for any other reason, such as billing, does not get this
      #   code. `appeal_url`, when present, is where the organization can appeal.
      # @raise [Anthropic::Models::RequestBodyEncodingInvalidError] The request body is not valid for its `Content-Encoding`.
      # @raise [Anthropic::Models::RequestBodyEncodingUnsupportedError] The request's `Content-Encoding` is not supported.
      # @raise [Anthropic::Models::ToolNameConflictError] A tool made available in `messages` takes a name that an available tool of
      #   another kind, or of another MCP server, already holds.
      # @raise [Anthropic::Models::ToolReferenceUnresolvedError] A tool change or MCP tool listing references a tool or MCP server that is not
      #   defined at that position in the conversation.
      # @raise [Anthropic::Models::RequestBodyTooLargeAfterDecodingError] The compressed request body exceeds the request size limit once decoded.
      # @raise [Anthropic::Models::EnforcedSpendLimitReachedError] The organization has crossed the monthly API usage threshold of its API tier.
      # @raise [Anthropic::Models::CompactionUnavailableError] The compaction could not be completed for a transient server reason. Retry the
      #   request.
      #
      # @return [Anthropic::Models::MessageTokensCount]
      #
      # @see Anthropic::Models::MessageCountTokensParams
      def count_tokens(params)
        parsed, options = Anthropic::MessageCountTokensParams.dump_request(params)
        Anthropic::Helpers::Messages.distill_input_schema_models!(parsed, strict: nil)
        header_params = {user_profile_id: "anthropic-user-profile-id", workspace_id: "anthropic-workspace-id"}
        @client.request(
          span_name: Anthropic::Internal::Tracing::SpanName::MESSAGES_COUNT_TOKENS,
          span_route: "/v1/messages/count_tokens",
          method: :post,
          path: "v1/messages/count_tokens",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Anthropic::MessageTokensCount,
          options: options
        )
      end

      # Streams a message like `stream_raw` and returns a MessageStream, which
      # accumulates the streamed events and parses tool inputs and structured output.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::MessageCreateParams} for more details.
      #
      # @overload stream(max_tokens:, messages:, model:, cache_control: nil, container: nil, diagnostics: nil, inference_geo: nil, metadata: nil, output_config: nil, service_tier: nil, speed: nil, stop_sequences: nil, system_: nil, thinking: nil, tool_choice: nil, tools: nil, user_profile_id: nil, workspace_id: nil, request_options: {})
      #
      # @param max_tokens [Integer] Body param: The maximum number of tokens to generate before stopping.
      #
      # @param messages [Array<Anthropic::Models::UserMessageParam, Anthropic::Models::AssistantMessageParam, Anthropic::Models::SystemMessageParam>] Body param: Input messages.
      #
      # @param model [Symbol, String, Anthropic::Models::Model] Body param: The model that will complete your prompt.
      #
      # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Body param: Top-level cache control automatically applies a cache_control marker
      #
      # @param container [Anthropic::Models::ContainerParams, String, nil] Body param: Container identifier for reuse across requests.
      #
      # @param diagnostics [Anthropic::Models::DiagnosticsParam, nil] Body param: Request-level diagnostics. Supply `previous_message_id` to have the
      #
      # @param inference_geo [String, nil] Body param: Specifies the geographic region for inference processing. If not spe
      #
      # @param metadata [Anthropic::Models::Metadata] Body param: An object describing metadata about the request.
      #
      # @param output_config [Anthropic::Models::OutputConfig] Body param: Configuration options for the model's output, such as the output for
      #
      # @param service_tier [Symbol, Anthropic::Models::MessageCreateParams::ServiceTier] Body param: Determines whether to use priority capacity (if available) or standa
      #
      # @param speed [Symbol, Anthropic::Models::MessageCreateParams::Speed, nil] Body param: The inference speed mode for this request. `"fast"` enables high out
      #
      # @param stop_sequences [Array<String>] Body param: Custom text sequences that will cause the model to stop generating.
      #
      # @param system_ [String, Array<Anthropic::Models::TextBlockParam>] Body param: System prompt.
      #
      # @param thinking [Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled, Anthropic::Models::ThinkingConfigBetweenTools, Anthropic::Models::ThinkingConfigAdaptive] Body param: Configuration for Claude's thinking.
      #
      # @param tool_choice [Anthropic::Models::ToolChoiceAuto, Anthropic::Models::ToolChoiceAny, Anthropic::Models::ToolChoiceTool, Anthropic::Models::ToolChoiceNone] Body param: How the model should use the provided tools. The model can use a spe
      #
      # @param tools [Array<Anthropic::Models::Tool, Anthropic::Models::ToolBash20250124, Anthropic::Models::CodeExecutionTool20250522, Anthropic::Models::CodeExecutionTool20250825, Anthropic::Models::CodeExecutionTool20260120, Anthropic::Models::CodeExecutionTool20260521, Anthropic::Models::BrowserToolset20260801, Anthropic::Models::MemoryTool20250818, Anthropic::Models::ComputerToolset20260801, Anthropic::Models::ToolTextEditor20250124, Anthropic::Models::ToolTextEditor20250429, Anthropic::Models::ToolTextEditor20250728, Anthropic::Models::WebSearchTool20250305, Anthropic::Models::WebFetchTool20250910, Anthropic::Models::WebSearchTool20260209, Anthropic::Models::WebFetchTool20260209, Anthropic::Models::WebFetchTool20260309, Anthropic::Models::WebSearchTool20260318, Anthropic::Models::WebFetchTool20260318, Anthropic::Models::ToolSearchToolBm25_20251119, Anthropic::Models::ToolSearchToolRegex20251119>] Body param: Definitions of tools that the model may use.
      #
      # @param user_profile_id [String] Header param: The user profile ID to attribute this request to. Use when acting
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Helpers::Streaming::MessageStream]
      def stream(params)
        parsed = Anthropic::Models::MessageCreateParams.dump_request(params).first
        warn_thinking_enabled(parsed)
        tools, models = Anthropic::Helpers::Messages.distill_input_schema_models!(parsed, strict: nil)
        Anthropic::Streaming::MessageStream.new(raw_stream: stream_raw(params), tools:, models:)
      end

      private

      def warn_thinking_enabled(parsed)
        if MODELS_TO_WARN_WITH_THINKING_ENABLED.include?(parsed[:model]) &&
           parsed[:thinking] &&
           parsed[:thinking][:type] == "enabled"
          warn(
            "Using Claude with #{parsed[:model]} and 'thinking.type=enabled' is deprecated. " \
            "Use thinking.type=adaptive instead which results in better model performance in " \
            "our testing: https://platform.claude.com/docs/en/build-with-claude/adaptive-thinking"
          )
        end
      end

      def stream_headers(headers = {})
        headers.merge("x-stainless-helper-method" => "stream")
      end

      # @api private
      #
      # @param client [Anthropic::Client]
      def initialize(client:)
        @client = client
        @batches = Anthropic::Resources::Messages::Batches.new(client: client)
      end
    end
  end
end
