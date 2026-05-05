# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # Overall verdict of a credential validation probe.
        module BetaManagedAgentsCredentialValidationStatus
          extend Anthropic::Internal::Type::Enum

          VALID = :valid
          INVALID = :invalid
          UNKNOWN = :unknown

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
