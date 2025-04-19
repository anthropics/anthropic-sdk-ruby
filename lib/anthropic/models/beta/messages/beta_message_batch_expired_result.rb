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

          # @!method initialize(type: :expired)
          #   @param type [Symbol, :expired]
        end
      end
    end
  end
end
