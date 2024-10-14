# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageBatchErroredResult < BaseModel
      # @!attribute [rw] error
      #   @return [Anthropic::Models::BetaErrorResponse]
      required :error, -> { Anthropic::Models::BetaErrorResponse }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaMessageBatchErroredResult::Type]
      required :type, enum: -> { Anthropic::Models::BetaMessageBatchErroredResult::Type }

      class Type < Anthropic::Enum
        ERRORED = :errored
      end

      # Create a new instance of BetaMessageBatchErroredResult from a Hash of raw data.
      #
      # @overload initialize(error: nil, type: nil)
      # @param error [Object]
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
