# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchCanceledResult < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :canceled]
          required :type, const: :canceled

          # @!parse
          #   # @param type [Symbol, :canceled]
          #   #
          #   def initialize(type: :canceled, **) = super

          # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
        end
      end
    end
  end
end
