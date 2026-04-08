# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthBasicResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Token endpoint uses HTTP Basic authentication with client credentials.
          sig do
            params(
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse::Type::TaggedSymbol
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CLIENT_SECRET_BASIC =
              T.let(
                :client_secret_basic,
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicResponse::Type::TaggedSymbol
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
