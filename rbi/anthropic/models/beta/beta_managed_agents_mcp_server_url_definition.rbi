# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMCPServerURLDefinition =
      Beta::BetaManagedAgentsMCPServerURLDefinition

    module Beta
      class BetaManagedAgentsMCPServerURLDefinition < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :url

        # URL-based MCP server connection as returned in API responses.
        sig do
          params(name: String, url: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(name:, url:, type: :url)
        end

        sig { override.returns({ name: String, type: Symbol, url: String }) }
        def to_hash
        end
      end
    end
  end
end
