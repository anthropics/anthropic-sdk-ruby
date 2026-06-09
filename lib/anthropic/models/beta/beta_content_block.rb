# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Response model for a file uploaded to the container.
      module BetaContentBlock
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text, -> { Anthropic::Beta::BetaTextBlock }

        variant :thinking, -> { Anthropic::Beta::BetaThinkingBlock }

        variant :redacted_thinking, -> { Anthropic::Beta::BetaRedactedThinkingBlock }

        variant :tool_use, -> { Anthropic::Beta::BetaToolUseBlock }

        variant :server_tool_use, -> { Anthropic::Beta::BetaServerToolUseBlock }

        variant :web_search_tool_result, -> { Anthropic::Beta::BetaWebSearchToolResultBlock }

        variant :web_fetch_tool_result, -> { Anthropic::Beta::BetaWebFetchToolResultBlock }

        variant :advisor_tool_result, -> { Anthropic::Beta::BetaAdvisorToolResultBlock }

        variant :code_execution_tool_result, -> { Anthropic::Beta::BetaCodeExecutionToolResultBlock }

        variant :bash_code_execution_tool_result, -> { Anthropic::Beta::BetaBashCodeExecutionToolResultBlock }

        variant :text_editor_code_execution_tool_result,
                -> { Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlock }

        variant :tool_search_tool_result, -> { Anthropic::Beta::BetaToolSearchToolResultBlock }

        variant :mcp_tool_use, -> { Anthropic::Beta::BetaMCPToolUseBlock }

        variant :mcp_tool_result, -> { Anthropic::Beta::BetaMCPToolResultBlock }

        # Response model for a file uploaded to the container.
        variant :container_upload, -> { Anthropic::Beta::BetaContainerUploadBlock }

        # A compaction block returned when autocompact is triggered.
        #
        # When content is None, it indicates the compaction failed to produce a valid
        # summary (e.g., malformed output from the model). Clients may round-trip
        # compaction blocks with null content; the server treats them as no-ops.
        variant :compaction, -> { Anthropic::Beta::BetaCompactionBlock }

        # Marks the point in `content` where one model's output gives way to the next.
        #
        # One block appears per hop where a preceding model actually ran this turn and
        # declined. A turn routed directly by the sticky decision has no such boundary
        # and carries no block — the signal for whether a fallback model served the
        # response is the presence of a `fallback_message` entry in
        # `usage.iterations`, not this block.
        #
        # The block is treated like a server-tool content block for streaming: it
        # arrives via the standard `content_block_start` / `content_block_stop`
        # pair and carries no deltas.
        variant :fallback, -> { Anthropic::Beta::BetaFallbackBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaServerToolUseBlock, Anthropic::Models::Beta::BetaWebSearchToolResultBlock, Anthropic::Models::Beta::BetaWebFetchToolResultBlock, Anthropic::Models::Beta::BetaAdvisorToolResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaToolSearchToolResultBlock, Anthropic::Models::Beta::BetaMCPToolUseBlock, Anthropic::Models::Beta::BetaMCPToolResultBlock, Anthropic::Models::Beta::BetaContainerUploadBlock, Anthropic::Models::Beta::BetaCompactionBlock, Anthropic::Models::Beta::BetaFallbackBlock)]
      end
    end

    BetaContentBlock = Beta::BetaContentBlock
  end
end
