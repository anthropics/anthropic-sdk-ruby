# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchExpiredResult < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :expired]
          required :type, const: :expired

          # @!parse
          #   # @param type [Symbol, :expired]
          #   #
          #   def initialize(type: :expired, **) = super

          # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
        end
      end
    end
  end
end
