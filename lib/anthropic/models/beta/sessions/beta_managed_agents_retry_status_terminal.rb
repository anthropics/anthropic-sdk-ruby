# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusTerminal < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::Type }

          # @!method initialize(type:)
          #   The session encountered a terminal error and will transition to `terminated`
          #   state.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsRetryStatusTerminal#type
          module Type
            extend Anthropic::Internal::Type::Enum

            TERMINAL = :terminal

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
