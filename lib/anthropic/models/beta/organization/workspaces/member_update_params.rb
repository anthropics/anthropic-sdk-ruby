# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          # @see Anthropic::Resources::Beta::Organization::Workspaces::Members#update
          class MemberUpdateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute workspace_id
            #   ID of the Workspace.
            #
            #   @return [String]
            required :workspace_id, String

            # @!attribute user_id
            #   ID of the User.
            #
            #   @return [String]
            required :user_id, String

            # @!attribute workspace_role
            #   New workspace role for the User.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaWorkspaceRole]
            required :workspace_role, enum: -> { Anthropic::Beta::Organization::BetaWorkspaceRole }

            # @!method initialize(workspace_id:, user_id:, workspace_role:, request_options: {})
            #   @param workspace_id [String] ID of the Workspace.
            #
            #   @param user_id [String] ID of the User.
            #
            #   @param workspace_role [Symbol, Anthropic::Models::Beta::Organization::BetaWorkspaceRole] New workspace role for the User.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
