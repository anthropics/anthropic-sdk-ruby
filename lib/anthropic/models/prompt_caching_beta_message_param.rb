# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaMessageParam < Anthropic::BaseModel
      # @!attribute [rw] content
      #   @return [Array<Anthropic::Models::PromptCachingBetaImageBlockParam, Anthropic::Models::PromptCachingBetaTextBlockParam, Anthropic::Models::PromptCachingBetaToolResultBlockParam, Anthropic::Models::PromptCachingBetaToolUseBlockParam>, String]
      required :content, Anthropic::Unknown

      # @!attribute [rw] role
      #   @return [Symbol, Anthropic::Models::PromptCachingBetaMessageParam::Role]
      required :role, enum: -> { Anthropic::Models::PromptCachingBetaMessageParam::Role }

      class Role < Anthropic::Enum
        USER = :user
        ASSISTANT = :assistant
      end

      # @!parse
      #   # Create a new instance of PromptCachingBetaMessageParam from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Array<Object>, String] :content
      #   #   @option data [String] :role
      #   def initialize(data = {}) = super
    end
  end
end
