# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Workspaces#retrieve
        class WorkspaceRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute workspace_id
          #   ID of the Workspace.
          #
          #   @return [String]
          required :workspace_id, String

          # @!method initialize(workspace_id:, request_options: {})
          #   @param workspace_id [String] ID of the Workspace.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
