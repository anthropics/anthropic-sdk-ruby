# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Regular text content.
      module BetaContentBlockParam
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :server_tool_use, -> { Anthropic::Beta::BetaServerToolUseBlockParam }

        variant :web_search_tool_result, -> { Anthropic::Beta::BetaWebSearchToolResultBlockParam }

        variant :code_execution_tool_result, -> { Anthropic::Beta::BetaCodeExecutionToolResultBlockParam }

        variant :mcp_tool_use, -> { Anthropic::Beta::BetaMCPToolUseBlockParam }

        variant :mcp_tool_result, -> { Anthropic::Beta::BetaRequestMCPToolResultBlockParam }

        # Regular text content.
        variant :text, -> { Anthropic::Beta::BetaTextBlockParam }

        # Image content specified directly as base64 data or as a reference via a URL.
        variant :image, -> { Anthropic::Beta::BetaImageBlockParam }

        # A block indicating a tool use by the model.
        variant :tool_use, -> { Anthropic::Beta::BetaToolUseBlockParam }

        # A block specifying the results of a tool use by the model.
        variant :tool_result, -> { Anthropic::Beta::BetaToolResultBlockParam }

        # Document content, either specified directly as base64 data, as text, or as a reference via a URL.
        variant :document, -> { Anthropic::Beta::BetaBase64PDFBlock }

        # A block specifying internal thinking by the model.
        variant :thinking, -> { Anthropic::Beta::BetaThinkingBlockParam }

        # A block specifying internal, redacted thinking by the model.
        variant :redacted_thinking, -> { Anthropic::Beta::BetaRedactedThinkingBlockParam }

        # A content block that represents a file to be uploaded to the container
        # Files uploaded via this block will be available in the container's input directory.
        variant :container_upload, -> { Anthropic::Beta::BetaContainerUploadBlockParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaServerToolUseBlockParam, Anthropic::Models::Beta::BetaWebSearchToolResultBlockParam, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlockParam, Anthropic::Models::Beta::BetaMCPToolUseBlockParam, Anthropic::Models::Beta::BetaRequestMCPToolResultBlockParam, Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock, Anthropic::Models::Beta::BetaThinkingBlockParam, Anthropic::Models::Beta::BetaRedactedThinkingBlockParam, Anthropic::Models::Beta::BetaContainerUploadBlockParam)]
      end
    end

    BetaContentBlockParam = Beta::BetaContentBlockParam
  end
end
