# frozen_string_literal: true

module Anthropic
  module Models
    class AssistantMessageParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::WebFetchToolResultBlockParam, Anthropic::Models::CodeExecutionToolResultBlockParam, Anthropic::Models::BashCodeExecutionToolResultBlockParam, Anthropic::Models::TextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::ToolSearchToolResultBlockParam, Anthropic::Models::ContainerUploadBlockParam>]
      required :content, union: -> { Anthropic::MessageContentParam }

      # @!attribute role
      #
      #   @return [Symbol, :assistant]
      required :role, const: :assistant

      # @!method initialize(content:, role: :assistant)
      #   @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::WebFetchToolResultBlockParam, Anthropic::Models::CodeExecutionToolResultBlockParam, Anthropic::Models::BashCodeExecutionToolResultBlockParam, Anthropic::Models::TextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::ToolSearchToolResultBlockParam, Anthropic::Models::ContainerUploadBlockParam>]
      #   @param role [Symbol, :assistant]
    end
  end
end
