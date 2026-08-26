# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          # @see Anthropic::Resources::Beta::Organization::Workspaces::Members#add
          class MemberAddParams < Anthropic::Internal::Type::BaseModel
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
            #   Role of the new Workspace Member. Cannot be `workspace_billing`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaNoBillingWorkspaceRole]
            required :workspace_role, enum: -> { Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole }

            # @!method initialize(workspace_id:, user_id:, workspace_role:, request_options: {})
            #   @param workspace_id [String] ID of the Workspace.
            #
            #   @param user_id [String] ID of the User.
            #
            #   @param workspace_role [Symbol, Anthropic::Models::Beta::Organization::BetaNoBillingWorkspaceRole] Role of the new Workspace Member. Cannot be `workspace_billing`.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
