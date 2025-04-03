# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchErroredResult < Anthropic::Internal::Type::BaseModel
          # @!attribute error
          #
          #   @return [Anthropic::Models::BetaErrorResponse]
          required :error, -> { Anthropic::Models::BetaErrorResponse }

          # @!attribute type
          #
          #   @return [Symbol, :errored]
          required :type, const: :errored

          # @!parse
          #   # @param error [Anthropic::Models::BetaErrorResponse]
          #   # @param type [Symbol, :errored]
          #   #
          #   def initialize(error:, type: :errored, **) = super

          # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
        end
      end
    end
  end
end
