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

          # The static bearer token to send to the MCP server, such as an API key or
          # personal access token.
          sig { returns(String) }
          attr_accessor :token

          # URL of the MCP server this credential authenticates against.
          sig { returns(String) }
          attr_accessor :mcp_server_url

          sig { returns(Symbol) }
          attr_accessor :type

          # Parameters for creating a static bearer token credential.
          sig do
            params(token: String, mcp_server_url: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The static bearer token to send to the MCP server, such as an API key or
            # personal access token.
            token:,
            # URL of the MCP server this credential authenticates against.
            mcp_server_url:,
            type: :static_bearer
          )
          end

          sig do
            override.returns(
              { token: String, mcp_server_url: String, type: Symbol }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
