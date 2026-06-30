# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsEnvironmentVariableUpdateParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Updated injection location.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams
              )
            )
          end
          attr_reader :injection_location

          sig do
            params(
              injection_location:
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams::OrHash
            ).void
          end
          attr_writer :injection_location

          # Updated networking scope. Full replacement.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams,
                  Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams
                )
              )
            )
          end
          attr_accessor :networking

          # Updated secret value.
          sig { returns(T.nilable(String)) }
          attr_accessor :secret_value

          # Parameters for updating an environment variable credential. `secret_name` is
          # immutable.
          sig do
            params(
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams::Type::OrSymbol,
              injection_location:
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams::OrHash,
              networking:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::OrHash,
                    Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::OrHash
                  )
                ),
              secret_value: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            type:,
            # Updated injection location.
            injection_location: nil,
            # Updated networking scope. Full replacement.
            networking: nil,
            # Updated secret value.
            secret_value: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams::Type::OrSymbol,
                injection_location:
                  Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams,
                networking:
                  T.nilable(
                    T.any(
                      Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams,
                      Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams
                    )
                  ),
                secret_value: T.nilable(String)
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ENVIRONMENT_VARIABLE =
              T.let(
                :environment_variable,
                Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams::Type::TaggedSymbol
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
