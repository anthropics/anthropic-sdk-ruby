# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchErroredResult < Anthropic::BaseModel
          # @!attribute error
          #
          #   @return [Anthropic::Models::BetaErrorResponse]
          required :error, -> { Anthropic::Models::BetaErrorResponse }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult::Type]
          required :type, enum: -> { Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult::Type }

          # @!parse
          #   # @param error [Anthropic::Models::BetaErrorResponse]
          #   # @param type [String]
          #   #
          #   def initialize(error:, type:) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          class Type < Anthropic::Enum
            ERRORED = :errored
          end
        end
      end
    end
  end
end
