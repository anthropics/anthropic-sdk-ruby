# frozen_string_literal: true

module Anthropic
  module Models
    class MessageParam < Anthropic::BaseModel
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

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      module Content
        extend Anthropic::Union

        ContentBlockParamArray = Anthropic::ArrayOf[union: -> { Anthropic::Models::ContentBlockParam }]

        variant String

        variant Anthropic::Models::MessageParam::Content::ContentBlockParamArray

        # @!parse
        #   # @return [Array(String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam, Anthropic::Models::ThinkingBlockParam, Anthropic::Models::RedactedThinkingBlockParam>)]
        #   def self.variants; end
      end

      module Role
        extend Anthropic::Enum

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
