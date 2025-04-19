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

          # @!method initialize(type: :canceled)
          #   @param type [Symbol, :canceled]
        end
      end
    end
  end
end
