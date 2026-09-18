# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # Overall verdict of a credential validation probe.
        module BetaManagedAgentsCredentialValidationStatus
          extend Anthropic::Internal::Type::Enum

          # The credential successfully authenticated against its MCP server.
          VALID = :valid

          # The probe reached the MCP server and was rejected, and a refresh (if attempted) did not recover it.
          INVALID = :invalid

          # The probe could not determine validity — for example, a transport error or a successful refresh that was not re-probed.
          UNKNOWN = :unknown

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
