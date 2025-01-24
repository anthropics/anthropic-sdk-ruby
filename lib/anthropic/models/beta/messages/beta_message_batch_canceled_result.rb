# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        # @example
        # ```ruby
        # beta_message_batch_canceled_result => {
        #   type: :canceled
        # }
        # ```
        class BetaMessageBatchCanceledResult < Anthropic::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :canceled]
          required :type, const: :canceled

          # @!parse
          #   # @param type [String]
          #   #
          #   def initialize(type: :canceled, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void
        end
      end
    end
  end
end
