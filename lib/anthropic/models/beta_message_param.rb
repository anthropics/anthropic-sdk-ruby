# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageParam < BaseModel
      # @!attribute [rw] content
      #   @return [Array<Anthropic::Models::BetaImageBlockParam, Anthropic::Models::BetaTextBlockParam, Anthropic::Models::BetaToolResultBlockParam, Anthropic::Models::BetaToolUseBlockParam>, String]
      required :content, Anthropic::Unknown

      # @!attribute [rw] role
      #   @return [Symbol, Anthropic::Models::BetaMessageParam::Role]
      required :role, enum: -> { Anthropic::Models::BetaMessageParam::Role }

      class Role < Anthropic::Enum
        USER = :user
        ASSISTANT = :assistant
      end
    end
  end
end
