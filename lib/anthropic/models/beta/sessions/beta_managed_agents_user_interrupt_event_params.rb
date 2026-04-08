# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserInterruptEventParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type }

          # @!method initialize(type:)
          #   Parameters for sending an interrupt to pause the agent.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams#type
          module Type
            extend Anthropic::Internal::Type::Enum

            USER_INTERRUPT = :"user.interrupt"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
