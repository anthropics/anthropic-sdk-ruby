# frozen_string_literal: true

module Anthropic
  module Models
    class MessageParam < BaseModel
      # @!attribute [rw] content
      #   @return [Array<Anthropic::Models::ImageBlockParam, Anthropic::Models::TextBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ToolUseBlockParam>, String]
      required :content, Anthropic::Unknown

      # @!attribute [rw] role
      #   @return [Symbol, Anthropic::Models::MessageParam::Role]
      required :role, enum: -> { Anthropic::Models::MessageParam::Role }

      class Role < Anthropic::Enum
        USER = :user
        ASSISTANT = :assistant
      end

      # Create a new instance of MessageParam from a Hash of raw data.
      #
      # @overload initialize(content: nil, role: nil)
      # @param content [Array<Object>, String]
      # @param role [String]
      def initialize(data = {})
        super
      end
    end
  end
end
