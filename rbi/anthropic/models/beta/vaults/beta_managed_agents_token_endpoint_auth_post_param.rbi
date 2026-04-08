# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthPostParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam,
                Anthropic::Internal::AnyHash
              )
            end

          # OAuth client secret.
          sig { returns(String) }
          attr_accessor :client_secret

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Token endpoint uses POST body authentication with client credentials.
          sig do
            params(
              client_secret: String,
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # OAuth client secret.
            client_secret:,
            type:
          )
          end

          sig do
            override.returns(
              {
                client_secret: String,
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam::Type::OrSymbol
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CLIENT_SECRET_POST =
              T.let(
                :client_secret_post,
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam::Type::TaggedSymbol
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
