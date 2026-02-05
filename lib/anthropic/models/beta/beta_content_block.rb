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

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaServerToolUseBlock, Anthropic::Models::Beta::BetaWebSearchToolResultBlock, Anthropic::Models::Beta::BetaWebFetchToolResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaBashCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaTextEditorCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaToolSearchToolResultBlock, Anthropic::Models::Beta::BetaMCPToolUseBlock, Anthropic::Models::Beta::BetaMCPToolResultBlock, Anthropic::Models::Beta::BetaContainerUploadBlock, Anthropic::Models::Beta::BetaCompactionBlock)]
      end
    end

    BetaContentBlock = Beta::BetaContentBlock
  end
end
