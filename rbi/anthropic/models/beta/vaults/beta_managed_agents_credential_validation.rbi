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

          # The failing step of an MCP validation probe.
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

          # Outcome of a refresh-token exchange attempted during credential validation.
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

          # Overall verdict of a credential validation probe.
          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidationStatus::TaggedSymbol
            )
          end
          attr_accessor :status

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidation::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # A timestamp in RFC 3339 format
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
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidation::Type::OrSymbol,
              validated_at: Time,
              vault_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier of the credential that was validated.
            credential_id:,
            # Whether the credential has a refresh token configured.
            has_refresh_token:,
            # The failing step of an MCP validation probe.
            mcp_probe:,
            # Outcome of a refresh-token exchange attempted during credential validation.
            refresh:,
            # Overall verdict of a credential validation probe.
            status:,
            type:,
            # A timestamp in RFC 3339 format
            validated_at:,
            # Identifier of the vault containing the credential.
            vault_id:
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
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidation::Type::TaggedSymbol,
                validated_at: Time,
                vault_id: String
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            VAULT_CREDENTIAL_VALIDATION =
              T.let(
                :vault_credential_validation,
                Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsCredentialValidation::Type::TaggedSymbol
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
end
