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

          sig { returns(Symbol) }
          attr_accessor :type

          # Static bearer token credential details for an MCP server.
          sig do
            params(mcp_server_url: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # URL of the MCP server this credential authenticates against.
            mcp_server_url:,
            type: :static_bearer
          )
          end

          sig { override.returns({ mcp_server_url: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
