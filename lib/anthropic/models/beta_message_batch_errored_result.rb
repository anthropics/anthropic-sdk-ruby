# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageBatchErroredResult < Anthropic::BaseModel
      # @!attribute [rw] error
      #   @return [Anthropic::Models::BetaErrorResponse]
      required :error, -> { Anthropic::Models::BetaErrorResponse }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaMessageBatchErroredResult::Type]
      required :type, enum: -> { Anthropic::Models::BetaMessageBatchErroredResult::Type }

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
