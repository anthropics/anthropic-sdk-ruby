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

          sig { returns(Symbol) }
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

          # The new networking scope, which replaces the stored one as a whole.
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

          # The new secret value to replace the stored one.
          sig { returns(T.nilable(String)) }
          attr_accessor :secret_value

          # Parameters for updating an environment variable credential. `secret_name` is
          # immutable.
          sig do
            params(
              injection_location:
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams::OrHash,
              networking:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::OrHash,
                    Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::OrHash
                  )
                ),
              secret_value: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Updated injection location.
            injection_location: nil,
            # The new networking scope, which replaces the stored one as a whole.
            networking: nil,
            # The new secret value to replace the stored one.
            secret_value: nil,
            type: :environment_variable
          )
          end

          sig do
            override.returns(
              {
                type: Symbol,
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
        end
      end
    end
  end
end
