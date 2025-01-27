# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # @example
        # ```ruby
        # beta_message_batch_succeeded_result => {
        #   message: Anthropic::Models::Beta::BetaMessage,
        #   type: :succeeded
        # }
        # ```
        class BetaMessageBatchSucceededResult < Anthropic::BaseModel
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

          # def initialize: (Hash | Anthropic::BaseModel) -> void
        end
      end
    end
  end
end
