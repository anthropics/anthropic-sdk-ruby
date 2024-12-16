# frozen_string_literal: true

module Anthropic
  module Models
    class MessageParam < Anthropic::BaseModel
      # @!attribute content
      #
      #   @return [Array<Anthropic::Models::ImageBlockParam, Anthropic::Models::TextBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ToolUseBlockParam>, String]
      required :content, Anthropic::Unknown

      # @!attribute role
      #
      #   @return [Symbol, Anthropic::Models::MessageParam::Role]
      required :role, enum: -> { Anthropic::Models::MessageParam::Role }

      # @!parse
      #   # @param content [Array<Anthropic::Models::ImageBlockParam, Anthropic::Models::TextBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ToolUseBlockParam>, String]
      #   # @param role [String]
      #   #
      #   def initialize(content:, role:) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      class Role < Anthropic::Enum
        USER = :user
        ASSISTANT = :assistant
      end
    end
  end
end
