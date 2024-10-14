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

      # Create a new instance of BetaMessageBatchExpiredResult from a Hash of raw data.
      #
      # @overload initialize(type: nil)
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
