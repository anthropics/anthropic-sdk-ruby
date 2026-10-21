# frozen_string_literal: true

module Anthropic
  module Models
    module MessageContentParam
      extend Anthropic::Internal::Type::Union

      variant String

      variant -> { Anthropic::Models::MessageContentParam::ContentBlockParamArray }

      # @!method self.variants
      #   @return [Array(String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::SearchResultBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::WebFetchToolResultBlockParam, Anthropic::Models::CodeExecutionToolResultBlockParam, Anthropic::Models::BashCodeExecutionToolResultBlockParam, Anthropic::Models::TextEditorCodeExecutionToolResultBlockParam, Anthropic::Models::ToolSearchToolResultBlockParam, Anthropic::Models::ContainerUploadBlockParam>)]

      # @type [Anthropic::Internal::Type::Converter]
      ContentBlockParamArray = Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::ContentBlockParam }]
    end
  end
end
