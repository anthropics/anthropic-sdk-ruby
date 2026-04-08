# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionEndTurn < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEndTurn::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn::Type }

          # @!method initialize(type:)
          #   The agent completed its turn naturally and is ready for the next user message.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEndTurn::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEndTurn#type
          module Type
            extend Anthropic::Internal::Type::Enum

            END_TURN = :end_turn

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
