# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # @example
        # ```ruby
        # beta_message_batch_succeeded_result => {
        #   message: Anthropic::Models::Beta::BetaMessage,
        #   type: Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult::Type
        # }
        # ```
        class BetaMessageBatchSucceededResult < Anthropic::BaseModel
          # @!attribute message
          #
          #   @return [Anthropic::Models::Beta::BetaMessage]
          required :message, -> { Anthropic::Models::Beta::BetaMessage }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult::Type
                   }

          # @!parse
          #   # @param message [Anthropic::Models::Beta::BetaMessage]
          #   # @param type [String]
          #   #
          #   def initialize(message:, type:, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # @example
          # ```ruby
          # case type
          # in :succeeded
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            SUCCEEDED = :succeeded

            finalize!
          end
        end
      end
    end
  end
end
