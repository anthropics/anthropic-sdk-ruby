# frozen_string_literal: true

module Anthropic
  module Models
    class MessageParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, Array<Anthropic::TextBlockParam, Anthropic::ImageBlockParam, Anthropic::ToolUseBlockParam, Anthropic::ServerToolUseBlockParam, Anthropic::WebSearchToolResultBlockParam, Anthropic::ToolResultBlockParam, Anthropic::DocumentBlockParam, Anthropic::ThinkingBlockParam, Anthropic::RedactedThinkingBlockParam>]
      required :content, union: -> { Anthropic::MessageParam::Content }

      # @!attribute role
      #
      #   @return [Symbol, Anthropic::MessageParam::Role]
      required :role, enum: -> { Anthropic::MessageParam::Role }

      # @!method initialize(content:, role:)
      #   @param content [String, Array<Anthropic::TextBlockParam, Anthropic::ImageBlockParam, Anthropic::ToolUseBlockParam, Anthropic::ServerToolUseBlockParam, Anthropic::WebSearchToolResultBlockParam, Anthropic::ToolResultBlockParam, Anthropic::DocumentBlockParam, Anthropic::ThinkingBlockParam, Anthropic::RedactedThinkingBlockParam>]
      #   @param role [Symbol, Anthropic::MessageParam::Role]

      # @see Anthropic::MessageParam#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant String

        variant -> { Anthropic::MessageParam::Content::ContentBlockParamArray }

        # @!method self.variants
        #   @return [Array(String, Array<Anthropic::TextBlockParam, Anthropic::ImageBlockParam, Anthropic::ToolUseBlockParam, Anthropic::ServerToolUseBlockParam, Anthropic::WebSearchToolResultBlockParam, Anthropic::ToolResultBlockParam, Anthropic::DocumentBlockParam, Anthropic::ThinkingBlockParam, Anthropic::RedactedThinkingBlockParam>)]

        # @type [Anthropic::Internal::Type::Converter]
        ContentBlockParamArray = Anthropic::Internal::Type::ArrayOf[union: -> {
          Anthropic::ContentBlockParam
        }]
      end

      # @see Anthropic::MessageParam#role
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
