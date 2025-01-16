# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # @example
        # ```ruby
        # beta_message_batch_expired_result => {
        #   type: enum: Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult::Type
        # }
        # ```
        class BetaMessageBatchExpiredResult < Anthropic::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult::Type]
          required :type, enum: -> { Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult::Type }

          # @!parse
          #   # @param type [String]
          #   #
          #   def initialize(type:, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # @example
          # ```ruby
          # case type
          # in :expired
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            EXPIRED = :expired

            finalize!
          end
        end
      end
    end
  end
end
