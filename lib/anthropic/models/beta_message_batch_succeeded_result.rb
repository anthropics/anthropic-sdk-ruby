# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageBatchSucceededResult < BaseModel
      # @!attribute [rw] message
      #   @return [Anthropic::Models::BetaMessage]
      required :message, -> { Anthropic::Models::BetaMessage }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaMessageBatchSucceededResult::Type]
      required :type, enum: -> { Anthropic::Models::BetaMessageBatchSucceededResult::Type }

      class Type < Anthropic::Enum
        SUCCEEDED = :succeeded
      end
    end
  end
end
