# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawContentBlockStartEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute content_block
        #   Response model for a file uploaded to the container.
        #
        #   @return [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaServerToolUseBlock, Anthropic::Models::Beta::BetaWebSearchToolResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaMCPToolUseBlock, Anthropic::Models::Beta::BetaMCPToolResultBlock, Anthropic::Models::Beta::BetaContainerUploadBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock]
        required :content_block, union: -> { Anthropic::Beta::BetaRawContentBlockStartEvent::ContentBlock }

        # @!attribute index
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_start]
        required :type, const: :content_block_start

        # @!method initialize(content_block:, index:, type: :content_block_start)
        #   @param content_block [Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaServerToolUseBlock, Anthropic::Models::Beta::BetaWebSearchToolResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaMCPToolUseBlock, Anthropic::Models::Beta::BetaMCPToolResultBlock, Anthropic::Models::Beta::BetaContainerUploadBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock] Response model for a file uploaded to the container.
        #
        #   @param index [Integer]
        #
        #   @param type [Symbol, :content_block_start]

        # Response model for a file uploaded to the container.
        #
        # @see Anthropic::Models::Beta::BetaRawContentBlockStartEvent#content_block
        module ContentBlock
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :text, -> { Anthropic::Beta::BetaTextBlock }

          variant :tool_use, -> { Anthropic::Beta::BetaToolUseBlock }

          variant :server_tool_use, -> { Anthropic::Beta::BetaServerToolUseBlock }

          variant :web_search_tool_result, -> { Anthropic::Beta::BetaWebSearchToolResultBlock }

          variant :code_execution_tool_result, -> { Anthropic::Beta::BetaCodeExecutionToolResultBlock }

          variant :mcp_tool_use, -> { Anthropic::Beta::BetaMCPToolUseBlock }

          variant :mcp_tool_result, -> { Anthropic::Beta::BetaMCPToolResultBlock }

          # Response model for a file uploaded to the container.
          variant :container_upload, -> { Anthropic::Beta::BetaContainerUploadBlock }

          variant :thinking, -> { Anthropic::Beta::BetaThinkingBlock }

          variant :redacted_thinking, -> { Anthropic::Beta::BetaRedactedThinkingBlock }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock, Anthropic::Models::Beta::BetaServerToolUseBlock, Anthropic::Models::Beta::BetaWebSearchToolResultBlock, Anthropic::Models::Beta::BetaCodeExecutionToolResultBlock, Anthropic::Models::Beta::BetaMCPToolUseBlock, Anthropic::Models::Beta::BetaMCPToolResultBlock, Anthropic::Models::Beta::BetaContainerUploadBlock, Anthropic::Models::Beta::BetaThinkingBlock, Anthropic::Models::Beta::BetaRedactedThinkingBlock)]
        end
      end
    end

    BetaRawContentBlockStartEvent = Beta::BetaRawContentBlockStartEvent
  end
end
