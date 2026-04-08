# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsStaticBearerUpdateParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Updated static bearer token value.
          sig { returns(T.nilable(String)) }
          attr_accessor :token

          # Parameters for updating a static bearer token credential. The `mcp_server_url`
          # is immutable.
          sig do
            params(
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::Type::OrSymbol,
              token: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            type:,
            # Updated static bearer token value.
            token: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::Type::OrSymbol,
                token: T.nilable(String)
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            STATIC_BEARER =
              T.let(
                :static_bearer,
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams::Type::TaggedSymbol
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
