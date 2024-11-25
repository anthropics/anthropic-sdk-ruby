# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaMessageParam < Anthropic::BaseModel
          # @!attribute [rw] content
          #   @return [Array<Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTextBlockParam, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolResultBlockParam, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolUseBlockParam>, String]
          required :content, Anthropic::Unknown

          # @!attribute [rw] role
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaMessageParam::Role]
          required :role,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaMessageParam::Role
                   }

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

      PromptCachingBetaMessageParam = PromptCaching::PromptCachingBetaMessageParam
    end
  end
end
