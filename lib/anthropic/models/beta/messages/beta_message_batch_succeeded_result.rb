# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchSucceededResult < Anthropic::Internal::Type::BaseModel
          # @!attribute message
          #
          #   @return [Anthropic::Models::Beta::BetaMessage]
          required :message, -> { Anthropic::Beta::BetaMessage }

          # @!attribute type
          #
          #   @return [Symbol, :succeeded]
          required :type, const: :succeeded

          # @!method initialize(message:, type: :succeeded)
          #   @param message [Anthropic::Models::Beta::BetaMessage]
          #   @param type [Symbol, :succeeded]
        end
      end
    end
  end
end
