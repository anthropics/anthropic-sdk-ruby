# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsRetryStatusTerminal < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :terminal]
          required :type, const: :terminal

          # @!method initialize(type: :terminal)
          #   The session encountered a terminal error and will transition to `terminated`
          #   state.
          #
          #   @param type [Symbol, :terminal]
        end
      end
    end
  end
end
