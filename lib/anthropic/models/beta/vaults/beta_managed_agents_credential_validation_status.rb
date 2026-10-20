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

          # The probe reached the MCP server and the server rejected the credential, or no access token is stored. A refresh, if one was tried, didn't recover it. Usually the end user needs to authorize again.
          INVALID = :invalid

          # The probe couldn't tell whether the credential works, for example because of a network error or because a refresh succeeded but the new access token wasn't tested. Validate the credential again to find out.
          UNKNOWN = :unknown

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
