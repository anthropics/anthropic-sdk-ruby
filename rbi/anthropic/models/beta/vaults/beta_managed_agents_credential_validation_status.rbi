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

          # The probe reached the MCP server and was rejected, and a refresh (if attempted) did not recover it.
          INVALID =
            T.let(
              :invalid,
              Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus::TaggedSymbol
            )

          # The probe could not determine validity — for example, a transport error or a successful refresh that was not re-probed.
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
