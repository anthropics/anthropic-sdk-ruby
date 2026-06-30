# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsEnvironmentVariableCreateParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Outbound hosts the secret value is substituted on.
          sig do
            returns(
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams,
                Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams
              )
            )
          end
          attr_accessor :networking

          # Name of the environment variable. Immutable after create.
          sig { returns(String) }
          attr_accessor :secret_name

          # Secret value. Write-only; never returned in responses.
          sig { returns(String) }
          attr_accessor :secret_value

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Where in the outbound request the secret value may be substituted.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationParams
              )
            )
          end
          attr_reader :injection_location

          sig do
            params(
              injection_location:
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationParams::OrHash
            ).void
          end
          attr_writer :injection_location

          # Parameters for creating an environment variable credential.
          sig do
            params(
              networking:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::OrHash
                ),
              secret_name: String,
              secret_value: String,
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams::Type::OrSymbol,
              injection_location:
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationParams::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Outbound hosts the secret value is substituted on.
            networking:,
            # Name of the environment variable. Immutable after create.
            secret_name:,
            # Secret value. Write-only; never returned in responses.
            secret_value:,
            type:,
            # Where in the outbound request the secret value may be substituted.
            injection_location: nil
          )
          end

          sig do
            override.returns(
              {
                networking:
                  T.any(
                    Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams,
                    Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams
                  ),
                secret_name: String,
                secret_value: String,
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams::Type::OrSymbol,
                injection_location:
                  Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationParams
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ENVIRONMENT_VARIABLE =
              T.let(
                :environment_variable,
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams::Type::TaggedSymbol
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
