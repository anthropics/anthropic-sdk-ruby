# frozen_string_literal: true

module Anthropic
  module Models
    # Regular text content.
    module ContentBlockParam
      extend Anthropic::Internal::Type::Union

      discriminator :type

      # Regular text content.
      variant :text, -> { Anthropic::TextBlockParam }

      # Image content specified directly as base64 data or as a reference via a URL.
      variant :image, -> { Anthropic::ImageBlockParam }

      # Document content, either specified directly as base64 data, as text, or as a reference via a URL.
      variant :document, -> { Anthropic::DocumentBlockParam }

      # A search result block containing source, title, and content from search operations.
      variant :search_result, -> { Anthropic::SearchResultBlockParam }

      # A block specifying internal thinking by the model.
      variant :thinking, -> { Anthropic::ThinkingBlockParam }

      # A block specifying internal, redacted thinking by the model.
      variant :redacted_thinking, -> { Anthropic::RedactedThinkingBlockParam }

      # A block indicating a tool use by the model.
      variant :tool_use, -> { Anthropic::ToolUseBlockParam }

      # A block specifying the results of a tool use by the model.
      variant :tool_result, -> { Anthropic::ToolResultBlockParam }

      variant :server_tool_use, -> { Anthropic::ServerToolUseBlockParam }

      variant :web_search_tool_result, -> { Anthropic::WebSearchToolResultBlockParam }

      variant :web_fetch_tool_result, -> { Anthropic::WebFetchToolResultBlockParam }

      variant :code_execution_tool_result, -> { Anthropic::CodeExecutionToolResultBlockParam }

      variant :bash_code_execution_tool_result, -> { Anthropic::BashCodeExecutionToolResultBlockParam }

      variant :text_editor_code_execution_tool_result,
              -> { Anthropic::TextEditorCodeExecutionToolResultBlockParam }

      variant :tool_search_tool_result, -> { Anthropic::ToolSearchToolResultBlockParam }

      # A content block that represents a file to be uploaded to the container
      # Files uploaded via this block will be available in the container's input directory.
      variant :container_upload, -> { Anthropic::ContainerUploadBlockParam }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::WebFetchToolResultBlockParam, Anthropic::Models::CodeExecutionToolResultBlockParam, Anthropic::Models::BashCodeExecutionToolResultBlockParam, Anthropic::Models::TextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::ToolSearchToolResultBlockParam, Anthropic::Models::ContainerUploadBlockParam)]
    end
  end
end
