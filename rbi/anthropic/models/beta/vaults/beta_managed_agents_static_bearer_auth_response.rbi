# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsStaticBearerAuthResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # URL of the MCP server this credential authenticates against.
          sig { returns(String) }
          attr_accessor :mcp_server_url

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Static bearer token credential details for an MCP server.
          sig do
            params(
              mcp_server_url: String,
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # URL of the MCP server this credential authenticates against.
            mcp_server_url:,
            type:
          )
          end

          sig do
            override.returns(
              {
                mcp_server_url: String,
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::Type::TaggedSymbol
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            STATIC_BEARER =
              T.let(
                :static_bearer,
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerAuthResponse::Type::TaggedSymbol
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
