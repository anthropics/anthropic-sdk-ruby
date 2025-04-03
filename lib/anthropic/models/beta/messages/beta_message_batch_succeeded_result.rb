# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchSucceededResult < Anthropic::Internal::Type::BaseModel
          # @!attribute message
          #
          #   @return [Anthropic::Models::Beta::BetaMessage]
          required :message, -> { Anthropic::Models::Beta::BetaMessage }

          # @!attribute type
          #
          #   @return [Symbol, :succeeded]
          required :type, const: :succeeded

          # @!parse
          #   # @param message [Anthropic::Models::Beta::BetaMessage]
          #   # @param type [Symbol, :succeeded]
          #   #
          #   def initialize(message:, type: :succeeded, **) = super

          # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
        end
      end
    end
  end
end
