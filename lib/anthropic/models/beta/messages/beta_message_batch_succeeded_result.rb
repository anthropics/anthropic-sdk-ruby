# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchSucceededResult < Anthropic::BaseModel
          # @!attribute message
          #   @return [Anthropic::Models::Beta::BetaMessage]
          required :message, -> { Anthropic::Models::Beta::BetaMessage }

          # @!attribute type
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult::Type
                   }

          class Type < Anthropic::Enum
            SUCCEEDED = :succeeded
          end

          # @!parse
          #   # Create a new instance of BetaMessageBatchSucceededResult from a Hash of raw
          #   #   data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [Object] :message
          #   #   @option data [String] :type
          #   def initialize(data = {}) = super
        end
      end
    end
  end
end
