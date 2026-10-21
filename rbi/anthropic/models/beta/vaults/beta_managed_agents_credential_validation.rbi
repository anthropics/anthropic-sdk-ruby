# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsCredentialValidation < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidation,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier of the credential that was validated.
          sig { returns(String) }
          attr_accessor :credential_id

          # Whether the credential has a refresh token configured.
          sig { returns(T::Boolean) }
          attr_accessor :has_refresh_token

          # Details of the MCP probe step that failed, or `null` if the probe succeeded or
          # there was no access token to test.
          sig do
            returns(
              T.nilable(Anthropic::Beta::Vaults::BetaManagedAgentsMCPProbe)
            )
          end
          attr_reader :mcp_probe

          sig do
            params(
              mcp_probe:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPProbe::OrHash
                )
            ).void
          end
          attr_writer :mcp_probe

          # Details of the refresh-token exchange attempted on a 401. Null when no refresh
          # was attempted.
          sig do
            returns(
              T.nilable(Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject)
            )
          end
          attr_reader :refresh

          sig do
            params(
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::OrHash
                )
            ).void
          end
          attr_writer :refresh

          # Overall verdict of the validation probe.
          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus::TaggedSymbol
            )
          end
          attr_accessor :status

          sig { returns(Symbol) }
          attr_accessor :type

          # When the validation probe was performed.
          sig { returns(Time) }
          attr_accessor :validated_at

          # Identifier of the vault containing the credential.
          sig { returns(String) }
          attr_accessor :vault_id

          # Result of live-probing a credential against its configured MCP server.
          sig do
            params(
              credential_id: String,
              has_refresh_token: T::Boolean,
              mcp_probe:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsMCPProbe::OrHash
                ),
              refresh:
                T.nilable(
                  Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::OrHash
                ),
              status:
                Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus::OrSymbol,
              validated_at: Time,
              vault_id: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier of the credential that was validated.
            credential_id:,
            # Whether the credential has a refresh token configured.
            has_refresh_token:,
            # Details of the MCP probe step that failed, or `null` if the probe succeeded or
            # there was no access token to test.
            mcp_probe:,
            # Details of the refresh-token exchange attempted on a 401. Null when no refresh
            # was attempted.
            refresh:,
            # Overall verdict of the validation probe.
            status:,
            # When the validation probe was performed.
            validated_at:,
            # Identifier of the vault containing the credential.
            vault_id:,
            type: :vault_credential_validation
          )
          end

          sig do
            override.returns(
              {
                credential_id: String,
                has_refresh_token: T::Boolean,
                mcp_probe:
                  T.nilable(Anthropic::Beta::Vaults::BetaManagedAgentsMCPProbe),
                refresh:
                  T.nilable(
                    Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject
                  ),
                status:
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus::TaggedSymbol,
                type: Symbol,
                validated_at: Time,
                vault_id: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
