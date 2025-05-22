# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchErroredResult < Anthropic::Internal::Type::BaseModel
          # @!attribute error
          #
          #   @return [Anthropic::Models::BetaErrorResponse]
          required :error, -> { Anthropic::BetaErrorResponse }

          # @!attribute type
          #
          #   @return [Symbol, :errored]
          required :type, const: :errored

          # @!method initialize(error:, type: :errored)
          #   @param error [Anthropic::Models::BetaErrorResponse]
          #   @param type [Symbol, :errored]
        end
      end
    end
  end
end
