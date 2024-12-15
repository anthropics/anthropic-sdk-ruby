# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchCanceledResult < Anthropic::BaseModel
          # @!attribute type
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult::Type]
          required :type, enum: -> { Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult::Type }

          class Type < Anthropic::Enum
            CANCELED = :canceled
          end

          # @!parse
          #   # Create a new instance of BetaMessageBatchCanceledResult from a Hash of raw data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [String] :type
          #   def initialize(data = {}) = super
        end
      end
    end
  end
end
