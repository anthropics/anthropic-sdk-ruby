# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyWorkspaceScope < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Scope type. Always `"workspace"`: the API key belongs to one Workspace.
          #
          #   @return [Symbol, :workspace]
          required :type, const: :workspace

          # @!attribute workspace_id
          #   ID of the Workspace the API key belongs to. Unlike the deprecated top-level
          #   `workspace_id`, this is the Workspace's real ID even for the organization's
          #   default Workspace.
          #
          #   @return [String]
          required :workspace_id, String

          # @!method initialize(workspace_id:, type: :workspace)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAPIKeyWorkspaceScope} for more
          #   details.
          #
          #   @param workspace_id [String] ID of the Workspace the API key belongs to. Unlike the deprecated top-level `wor
          #
          #   @param type [Symbol, :workspace] Scope type. Always `"workspace"`: the API key belongs to one Workspace.
        end
      end
    end
  end
end
