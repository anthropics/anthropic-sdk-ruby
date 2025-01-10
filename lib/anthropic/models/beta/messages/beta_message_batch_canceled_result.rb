# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # @example
        #
        # ```ruby
        # beta_message_batch_canceled_result => {
        #   type: Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult::Type
        # }
        # ```
        class BetaMessageBatchCanceledResult < Anthropic::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult::Type]
          required :type, enum: -> { Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult::Type }

          # @!parse
          #   # @param type [String]
          #   #
          #   def initialize(type:, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # @example
          #
          # ```ruby
          # case type
          # in :canceled
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            CANCELED = :canceled

            finalize!
          end
        end
      end
    end
  end
end
