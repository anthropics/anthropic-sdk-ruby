# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchCanceledResult < Anthropic::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult::Type]
          required :type, enum: -> { Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult::Type }

          # @!parse
          #   # @param type [String]
          #   #
          #   def initialize(type:) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          class Type < Anthropic::Enum
            CANCELED = :canceled
          end
        end
      end
    end
  end
end
