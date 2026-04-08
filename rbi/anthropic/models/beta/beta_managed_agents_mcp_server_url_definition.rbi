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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :url

        # URL-based MCP server connection as returned in API responses.
        sig do
          params(
            name: String,
            type:
              Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::Type::OrSymbol,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(name:, type:, url:)
        end

        sig do
          override.returns(
            {
              name: String,
              type:
                Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::Type::TaggedSymbol,
              url: String
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
                Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          URL =
            T.let(
              :url,
              Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsMCPServerURLDefinition::Type::TaggedSymbol
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
