# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class APIKeyWorkspaceScope < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #   Scope type. Always `"workspace"`: the API key belongs to one Workspace.
        #
        #   @return [Symbol, :workspace]
        required :type, const: :workspace

        # @!attribute workspace_id
        #   ID of the Workspace the API key belongs to, including when it is the
        #   organization's default Workspace.
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(workspace_id:, type: :workspace)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::APIKeyWorkspaceScope} for more details.
        #
        #   @param workspace_id [String] ID of the Workspace the API key belongs to, including when it is the organizatio
        #
        #   @param type [Symbol, :workspace] Scope type. Always `"workspace"`: the API key belongs to one Workspace.
      end
    end
  end
end
