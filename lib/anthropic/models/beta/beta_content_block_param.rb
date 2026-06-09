# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Regular text content.
      module BetaContentBlockParam
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Regular text content.
        variant :text, -> { Anthropic::Beta::BetaTextBlockParam }

        # Image content specified directly as base64 data or as a reference via a URL.
        variant :image, -> { Anthropic::Beta::BetaImageBlockParam }

        # Document content, either specified directly as base64 data, as text, or as a reference via a URL.
        variant :document, -> { Anthropic::Beta::BetaRequestDocumentBlock }

        # A search result block containing source, title, and content from search operations.
        variant :search_result, -> { Anthropic::Beta::BetaSearchResultBlockParam }

        # A block specifying internal thinking by the model.
        variant :thinking, -> { Anthropic::Beta::BetaThinkingBlockParam }

        # A block specifying internal, redacted thinking by the model.
        variant :redacted_thinking, -> { Anthropic::Beta::BetaRedactedThinkingBlockParam }

        # A block indicating a tool use by the model.
        variant :tool_use, -> { Anthropic::Beta::BetaToolUseBlockParam }

        # A block specifying the results of a tool use by the model.
        variant :tool_result, -> { Anthropic::Beta::BetaToolResultBlockParam }

        variant :server_tool_use, -> { Anthropic::Beta::BetaServerToolUseBlockParam }

        variant :web_search_tool_result, -> { Anthropic::Beta::BetaWebSearchToolResultBlockParam }

        variant :web_fetch_tool_result, -> { Anthropic::Beta::BetaWebFetchToolResultBlockParam }

        variant :advisor_tool_result, -> { Anthropic::Beta::BetaAdvisorToolResultBlockParam }

        variant :code_execution_tool_result, -> { Anthropic::Beta::BetaCodeExecutionToolResultBlockParam }

        variant :bash_code_execution_tool_result,
                -> { Anthropic::Beta::BetaBashCodeExecutionToolResultBlockParam }

        variant :text_editor_code_execution_tool_result,
                -> { Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlockParam }

        variant :tool_search_tool_result, -> { Anthropic::Beta::BetaToolSearchToolResultBlockParam }

        variant :mcp_tool_use, -> { Anthropic::Beta::BetaMCPToolUseBlockParam }

        variant :mcp_tool_result, -> { Anthropic::Beta::BetaRequestMCPToolResultBlockParam }

        # A content block that represents a file to be uploaded to the container
        # Files uploaded via this block will be available in the container's input directory.
        variant :container_upload, -> { Anthropic::Beta::BetaContainerUploadBlockParam }

        # A compaction block containing summary of previous context.
        #
        # Users should round-trip these blocks from responses to subsequent requests
        # to maintain context across compaction boundaries.
        #
        # When content is None, the block represents a failed compaction. The server
        # treats these as no-ops. Empty string content is not allowed.
        variant :compaction, -> { Anthropic::Beta::BetaCompactionBlockParam }

        # System instructions that appear mid-conversation.
        #
        # Use this block to provide or update system-level instructions at a specific
        # point in the conversation, rather than only via the top-level `system` parameter.
        variant :mid_conv_system, -> { Anthropic::Beta::BetaMidConversationSystemBlockParam }

        # A `fallback` block echoed back from a prior response.
        #
        # Accepted in `messages[].content` and never rendered into the prompt,
        # not validated against the request's `fallbacks` chain or top-level
        # `model`, and stripped before the sticky-routing cache key is computed.
        #
        # Callers should echo the assistant turn verbatim — block included. The
        # block's position is load-bearing for thinking verification: the thinking
        # runs on either side of a fallback hop carry independently-rooted
        # verification hash chains, and this block is the only record of where one
        # chain ends and the next begins. When thinking runs flank the boundary,
        # omitting the block merges the runs into one contiguous span whose hashes
        # cannot verify (the request is rejected), and moving it into the middle of
        # a single run splits that run's chain and is likewise rejected; between
        # non-thinking blocks the block's placement has no verification effect.
        variant :fallback, -> { Anthropic::Beta::BetaFallbackBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaRequestDocumentBlock, Anthropic::Models::Beta::BetaSearchResultBlockParam, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaWebFetchToolResultBlockParam, Anthropic::Models::Beta::BetaAdvisorToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaToolSearchToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam, Anthropic::Models::Beta::BetaCompactionBlockParam, Anthropic::Models::Beta::BetaMidConversationSystemBlockParam, Anthropic::Models::Beta::BetaFallbackBlockParam)]
      end
    end

    BetaContentBlockParam = Beta::BetaContentBlockParam
  end
end
