# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageBatchExpiredResult < BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaMessageBatchExpiredResult::Type]
      required :type, enum: -> { Anthropic::Models::BetaMessageBatchExpiredResult::Type }

      class Type < Anthropic::Enum
        EXPIRED = :expired
      end
    end
  end
end
