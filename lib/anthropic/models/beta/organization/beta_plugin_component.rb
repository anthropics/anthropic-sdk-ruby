# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginComponent < Anthropic::Internal::Type::BaseModel
          # @!attribute description
          #   What the component declares about itself; always null for MCP servers, hooks,
          #   and CLIs.
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!attribute name
          #   The component's name: a skill's, command's or agent's name, an MCP server's key
          #   in the manifest, the event a hook runs on, or a CLI's executable.
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #   The kind of component.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaPluginComponent::Type]
          required :type, enum: -> { Anthropic::Beta::Organization::BetaPluginComponent::Type }

          # @!method initialize(description:, name:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaPluginComponent} for more details.
          #
          #   @param description [String, nil] What the component declares about itself; always null for MCP servers, hooks, an
          #
          #   @param name [String] The component's name: a skill's, command's or agent's name, an MCP server's key
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Organization::BetaPluginComponent::Type] The kind of component.

          # The kind of component.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPluginComponent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT = :agent
            CLI = :cli
            COMMAND = :command
            HOOK = :hook
            MCP_SERVER = :mcp_server
            SKILL = :skill

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
