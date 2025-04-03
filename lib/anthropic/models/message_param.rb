# frozen_string_literal: true

module Anthropic
  module Models
    class MessageParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam>]
      required :content, union: -> { Anthropic::Models::MessageParam::Content }

      # @!attribute role
      #
      #   @return [Symbol, Anthropic::Models::MessageParam::Role]
      required :role, enum: -> { Anthropic::Models::MessageParam::Role }

      # @!parse
      #   # @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam>]
      #   # @param role [Symbol, Anthropic::Models::MessageParam::Role]
      #   #
      #   def initialize(content:, role:, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void

      # @see Anthropic::Models::MessageParam#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant String

        variant -> { Anthropic::Models::MessageParam::Content::ContentBlockParamArray }

        # @!parse
        #   # @return [Array(String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam>)]
        #   def self.variants; end

        ContentBlockParamArray =
          Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::Models::ContentBlockParam }]
      end

      # @see Anthropic::Models::MessageParam#role
      module Role
        extend Anthropic::Internal::Type::Enum

        USER = :user
        ASSISTANT = :assistant

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
