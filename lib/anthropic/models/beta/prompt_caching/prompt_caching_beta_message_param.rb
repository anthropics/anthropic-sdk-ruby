# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaMessageParam < Anthropic::BaseModel
          # @!attribute content
          #
          #   @return [Array<Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTextBlockParam, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolResultBlockParam, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolUseBlockParam>, String]
          required :content, Anthropic::Unknown

          # @!attribute role
          #
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaMessageParam::Role]
          required :role,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaMessageParam::Role
                   }

          # @!parse
          #   # @param content [Array<Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTextBlockParam, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolResultBlockParam, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolUseBlockParam>, String]
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

      PromptCachingBetaMessageParam = PromptCaching::PromptCachingBetaMessageParam
    end
  end
end
