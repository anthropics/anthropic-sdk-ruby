# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchExpiredResult < Anthropic::BaseModel
          # @!attribute [rw] type
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult::Type]
          required :type, enum: -> { Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult::Type }

          class Type < Anthropic::Enum
            EXPIRED = :expired
          end

          # @!parse
          #   # Create a new instance of BetaMessageBatchExpiredResult from a Hash of raw data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [String] :type
          #   def initialize(data = {}) = super
        end
      end
    end
  end
end
