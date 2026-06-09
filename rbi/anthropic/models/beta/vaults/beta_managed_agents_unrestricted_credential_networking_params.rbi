# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsUnrestrictedCredentialNetworkingParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Substitute the secret on any host the session's Environment network policy
          # permits egress to. The Environment's network policy is the only boundary on
          # where the secret can reach.
          sig do
            params(
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::Type::OrSymbol
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            UNRESTRICTED =
              T.let(
                :unrestricted,
                Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::Type::TaggedSymbol
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
