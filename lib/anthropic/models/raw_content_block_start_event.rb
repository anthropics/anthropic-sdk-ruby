# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockStartEvent < Anthropic::Internal::Type::BaseModel
      # @!attribute content_block
      #   Response model for a file uploaded to the container.
      #
      #   @return [Anthropic::Models::TextBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ServerToolUseBlock, Anthropic::Models::WebSearchToolResultBlock, Anthropic::Models::WebFetchToolResultBlock, Anthropic::Models::CodeExecutionToolResultBlock, Anthropic::Models::BashCodeExecutionToolResultBlock, Anthropic::Models::TextEditorCodeExecutionToolResultBlock, Anthropic::Models::ToolSearchToolResultBlock, Anthropic::Models::ContainerUploadBlock]
      required :content_block, union: -> { Anthropic::RawContentBlockStartEvent::ContentBlock }

      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, :content_block_start]
      required :type, const: :content_block_start

      # @!method initialize(content_block:, index:, type: :content_block_start)
      #   @param content_block [Anthropic::Models::TextBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ServerToolUseBlock, Anthropic::Models::WebSearchToolResultBlock, Anthropic::Models::WebFetchToolResultBlock, Anthropic::Models::CodeExecutionToolResultBlock, Anthropic::Models::BashCodeExecutionToolResultBlock, Anthropic::Models::TextEditorCodeExecutionToolResultBlock, Anthropic::Models::ToolSearchToolResultBlock, Anthropic::Models::ContainerUploadBlock] Response model for a file uploaded to the container.
      #
      #   @param index [Integer]
      #
      #   @param type [Symbol, :content_block_start]

      # Response model for a file uploaded to the container.
      #
      # @see Anthropic::Models::RawContentBlockStartEvent#content_block
      module ContentBlock
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :text, -> { Anthropic::TextBlock }

        variant :thinking, -> { Anthropic::ThinkingBlock }

        variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlock }

        variant :tool_use, -> { Anthropic::ToolUseBlock }

        variant :server_tool_use, -> { Anthropic::ServerToolUseBlock }

        variant :web_search_tool_result, -> { Anthropic::WebSearchToolResultBlock }

        variant :web_fetch_tool_result, -> { Anthropic::WebFetchToolResultBlock }

        variant :code_execution_tool_result, -> { Anthropic::CodeExecutionToolResultBlock }

        variant :bash_code_execution_tool_result, -> { Anthropic::BashCodeExecutionToolResultBlock }

        variant :text_editor_code_execution_tool_result, -> { Anthropic::TextEditorCodeExecutionToolResultBlock }

        variant :tool_search_tool_result, -> { Anthropic::ToolSearchToolResultBlock }

        # Response model for a file uploaded to the container.
        variant :container_upload, -> { Anthropic::ContainerUploadBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::TextBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ServerToolUseBlock, Anthropic::Models::WebSearchToolResultBlock, Anthropic::Models::WebFetchToolResultBlock, Anthropic::Models::CodeExecutionToolResultBlock, Anthropic::Models::BashCodeExecutionToolResultBlock, Anthropic::Models::TextEditorCodeExecutionToolResultBlock, Anthropic::Models::ToolSearchToolResultBlock, Anthropic::Models::ContainerUploadBlock)]
      end
    end
  end
end
