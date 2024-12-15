# frozen_string_literal: true

module Anthropic
  module Models
    class MessageParam < Anthropic::BaseModel
      # @!attribute content
      #   @return [Array<Anthropic::Models::ImageBlockParam, Anthropic::Models::TextBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::ToolUseBlockParam>, String]
      required :content, Anthropic::Unknown

      # @!attribute role
      #   @return [Symbol, Anthropic::Models::MessageParam::Role]
      required :role, enum: -> { Anthropic::Models::MessageParam::Role }

      class Role < Anthropic::Enum
        USER = :user
        ASSISTANT = :assistant
      end

      # @!parse
      #   # Create a new instance of MessageParam from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Array<Object>, String] :content
      #   #   @option data [String] :role
      #   def initialize(data = {}) = super
    end
  end
end
