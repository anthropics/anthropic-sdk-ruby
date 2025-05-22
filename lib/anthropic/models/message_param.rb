# frozen_string_literal: true

module Anthropic
  module Models
    class MessageParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, Array<Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam>]
      required :content, union: -> { Anthropic::MessageParam::Content }

      # @!attribute role
      #
      #   @return [Symbol, Anthropic::Models::MessageParam::Role]
      required :role, enum: -> { Anthropic::MessageParam::Role }

      # @!method initialize(content:, role:)
      #   @param content [String, Array<Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam>]
      #   @param role [Symbol, Anthropic::Models::MessageParam::Role]

      # @see Anthropic::Models::MessageParam#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant String

        variant -> { Anthropic::Models::MessageParam::Content::ContentBlockParamArray }

        # @!method self.variants
        #   @return [Array(String, Array<Anthropic::Models::ServerToolUseBlockParam, Anthropic::Models::WebSearchToolResultBlockParam, Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam>)]

        # @type [Anthropic::Internal::Type::Converter]
        ContentBlockParamArray = Anthropic::Internal::Type::ArrayOf[union: -> {
          Anthropic::ContentBlockParam
        }]
      end

      # @see Anthropic::Models::MessageParam#role
      module Role
        extend Anthropic::Internal::Type::Enum

        USER = :user
        ASSISTANT = :assistant

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
