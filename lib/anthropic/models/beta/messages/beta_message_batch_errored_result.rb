# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchErroredResult < Anthropic::BaseModel
          # @!attribute error
          #   @return [Anthropic::Models::BetaErrorResponse]
          required :error, -> { Anthropic::Models::BetaErrorResponse }

          # @!attribute type
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult::Type]
          required :type, enum: -> { Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult::Type }

          class Type < Anthropic::Enum
            ERRORED = :errored
          end

          # @!parse
          #   # Create a new instance of BetaMessageBatchErroredResult from a Hash of raw data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [Object] :error
          #   #   @option data [String] :type
          #   def initialize(data = {}) = super
        end
      end
    end
  end
end
