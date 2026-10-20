# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        # Overall verdict of a credential validation probe.
        module BetaManagedAgentsCredentialValidationStatus
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The credential successfully authenticated against its MCP server.
          VALID =
            T.let(
              :valid,
              Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus::TaggedSymbol
            )

          # The probe reached the MCP server and the server rejected the credential, or no access token is stored. A refresh, if one was tried, didn't recover it. Usually the end user needs to authorize again.
          INVALID =
            T.let(
              :invalid,
              Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus::TaggedSymbol
            )

          # The probe couldn't tell whether the credential works, for example because of a network error or because a refresh succeeded but the new access token wasn't tested. Validate the credential again to find out.
          UNKNOWN =
            T.let(
              :unknown,
              Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
