# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module Workspaces
        # @see Anthropic::Resources::Organization::Workspaces::ServiceAccounts#update
        class ServiceAccountUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute workspace_id
          #   ID of the workspace.
          #
          #   @return [String]
          required :workspace_id, String

          # @!attribute service_account_id
          #   ID of the service account.
          #
          #   @return [String]
          required :service_account_id, String

          # @!attribute workspace_role
          #   New role for the service account in this workspace.
          #
          #   @return [Symbol, Anthropic::Models::Organization::NoBillingWorkspaceRole]
          required :workspace_role, enum: -> { Anthropic::Organization::NoBillingWorkspaceRole }

          # @!method initialize(workspace_id:, service_account_id:, workspace_role:, request_options: {})
          #   @param workspace_id [String] ID of the workspace.
          #
          #   @param service_account_id [String] ID of the service account.
          #
          #   @param workspace_role [Symbol, Anthropic::Models::Organization::NoBillingWorkspaceRole] New role for the service account in this workspace.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
