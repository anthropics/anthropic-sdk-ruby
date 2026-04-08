# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsStaticBearerCreateParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Static bearer token value.
          sig { returns(String) }
          attr_accessor :token

          # URL of the MCP server this credential authenticates against.
          sig { returns(String) }
          attr_accessor :mcp_server_url

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Parameters for creating a static bearer token credential.
          sig do
            params(
              token: String,
              mcp_server_url: String,
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Static bearer token value.
            token:,
            # URL of the MCP server this credential authenticates against.
            mcp_server_url:,
            type:
          )
          end

          sig do
            override.returns(
              {
                token: String,
                mcp_server_url: String,
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::Type::OrSymbol
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            STATIC_BEARER =
              T.let(
                :static_bearer,
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::Type::TaggedSymbol
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
