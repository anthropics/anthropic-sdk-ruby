# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginComponent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginComponent,
                Anthropic::Internal::AnyHash
              )
            end

          # What the component declares about itself; always null for MCP servers, hooks,
          # and CLIs.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # The component's name: a skill's, command's or agent's name, an MCP server's key
          # in the manifest, the event a hook runs on, or a CLI's executable.
          sig { returns(String) }
          attr_accessor :name

          # The kind of component.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaPluginComponent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              description: T.nilable(String),
              name: String,
              type:
                Anthropic::Beta::Organization::BetaPluginComponent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # What the component declares about itself; always null for MCP servers, hooks,
            # and CLIs.
            description:,
            # The component's name: a skill's, command's or agent's name, an MCP server's key
            # in the manifest, the event a hook runs on, or a CLI's executable.
            name:,
            # The kind of component.
            type:
          )
          end

          sig do
            override.returns(
              {
                description: T.nilable(String),
                name: String,
                type:
                  Anthropic::Beta::Organization::BetaPluginComponent::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The kind of component.
          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaPluginComponent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AGENT =
              T.let(
                :agent,
                Anthropic::Beta::Organization::BetaPluginComponent::Type::TaggedSymbol
              )
            CLI =
              T.let(
                :cli,
                Anthropic::Beta::Organization::BetaPluginComponent::Type::TaggedSymbol
              )
            COMMAND =
              T.let(
                :command,
                Anthropic::Beta::Organization::BetaPluginComponent::Type::TaggedSymbol
              )
            HOOK =
              T.let(
                :hook,
                Anthropic::Beta::Organization::BetaPluginComponent::Type::TaggedSymbol
              )
            MCP_SERVER =
              T.let(
                :mcp_server,
                Anthropic::Beta::Organization::BetaPluginComponent::Type::TaggedSymbol
              )
            SKILL =
              T.let(
                :skill,
                Anthropic::Beta::Organization::BetaPluginComponent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPluginComponent::Type::TaggedSymbol
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
