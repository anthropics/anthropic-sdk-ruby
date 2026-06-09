# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsUnrestrictedCredentialNetworkingResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The secret is substituted on any host the session's Environment network policy
          # permits egress to.
          sig do
            params(
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::Type::TaggedSymbol
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            UNRESTRICTED =
              T.let(
                :unrestricted,
                Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::Type::TaggedSymbol
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
