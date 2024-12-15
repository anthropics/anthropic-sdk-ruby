# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchExpiredResult < Anthropic::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult::Type]
          required :type, enum: -> { Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult::Type }

          # @!parse
          #   # @param type [String]
          #   #
          #   def initialize(type:) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          class Type < Anthropic::Enum
            EXPIRED = :expired
          end
        end
      end
    end
  end
end
