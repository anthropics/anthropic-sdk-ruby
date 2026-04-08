# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusExhausted < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::Type }

          # @!method initialize(type:)
          #   This turn is dead; queued inputs are flushed and the session returns to idle.
          #   Client may send a new prompt.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusExhausted#type
          module Type
            extend Anthropic::Internal::Type::Enum

            EXHAUSTED = :exhausted

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
