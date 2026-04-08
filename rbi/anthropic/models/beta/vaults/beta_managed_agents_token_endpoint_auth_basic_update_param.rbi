# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthBasicUpdateParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Updated OAuth client secret.
          sig { returns(T.nilable(String)) }
          attr_accessor :client_secret

          # Updated HTTP Basic authentication parameters for the token endpoint.
          sig do
            params(
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::Type::OrSymbol,
              client_secret: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            type:,
            # Updated OAuth client secret.
            client_secret: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::Type::OrSymbol,
                client_secret: T.nilable(String)
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CLIENT_SECRET_BASIC =
              T.let(
                :client_secret_basic,
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam::Type::TaggedSymbol
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
