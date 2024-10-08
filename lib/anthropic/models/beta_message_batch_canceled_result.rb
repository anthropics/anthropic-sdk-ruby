# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageBatchCanceledResult < BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaMessageBatchCanceledResult::Type]
      required :type, enum: -> { Anthropic::Models::BetaMessageBatchCanceledResult::Type }

      class Type < Anthropic::Enum
        CANCELED = :canceled
      end
    end
  end
end
