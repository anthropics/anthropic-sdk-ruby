# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsEnvironmentVariableAuthResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # Where in the outbound request the secret value is substituted.
          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationResponse
            )
          end
          attr_reader :injection_location

          sig do
            params(
              injection_location:
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationResponse::OrHash
            ).void
          end
          attr_writer :injection_location

          # Outbound hosts the secret value is substituted on.
          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Networking::Variants
            )
          end
          attr_accessor :networking

          # Name of the environment variable.
          sig { returns(String) }
          attr_accessor :secret_name

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Environment variable credential details. The secret value is never returned.
          sig do
            params(
              injection_location:
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationResponse::OrHash,
              networking:
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::OrHash,
                  Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::OrHash
                ),
              secret_name: String,
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Where in the outbound request the secret value is substituted.
            injection_location:,
            # Outbound hosts the secret value is substituted on.
            networking:,
            # Name of the environment variable.
            secret_name:,
            type:
          )
          end

          sig do
            override.returns(
              {
                injection_location:
                  Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationResponse,
                networking:
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Networking::Variants,
                secret_name: String,
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Outbound hosts the secret value is substituted on.
          module Networking
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse,
                  Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Networking::Variants
                ]
              )
            end
            def self.variants
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ENVIRONMENT_VARIABLE =
              T.let(
                :environment_variable,
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Type::TaggedSymbol
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
