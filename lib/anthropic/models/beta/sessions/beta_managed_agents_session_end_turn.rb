# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionEndTurn < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :end_turn]
          required :type, const: :end_turn

          # @!method initialize(type: :end_turn)
          #   The agent completed its turn naturally and is ready for the next user message.
          #
          #   @param type [Symbol, :end_turn]
        end
      end
    end
  end
end
