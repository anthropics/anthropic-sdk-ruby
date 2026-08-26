# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaServiceAccountWorkspaceMember < Anthropic::Internal::Type::BaseModel
          # @!attribute created_by_actor_id
          #   Tagged ID (`user_...`/`svac_...`) of the actor who created this membership.
          #
          #   @return [String, nil]
          required :created_by_actor_id, String, nil?: true

          # @!attribute implicit
          #   True when this is the implicit default-workspace membership every service
          #   account has when no explicit membership exists. Implicit memberships have role
          #   `workspace_user` and cannot be removed.
          #
          #   @return [Boolean, nil]
          required :implicit, Anthropic::Internal::Type::Boolean, nil?: true

          # @!attribute service_account_id
          #   Tagged service account ID (`svac_...`).
          #
          #   @return [String]
          required :service_account_id, String

          # @!attribute type
          #
          #   @return [Symbol, :service_account_workspace_member]
          required :type, const: :service_account_workspace_member

          # @!attribute workspace_id
          #   Tagged workspace ID (`wrkspc_...`).
          #
          #   @return [String]
          required :workspace_id, String

          # @!attribute workspace_role
          #   Role of the service account in this workspace. Service accounts cannot hold the
          #   `workspace_billing` role.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaWorkspaceRole]
          required :workspace_role, enum: -> { Anthropic::Beta::Organization::BetaWorkspaceRole }

          # @!method initialize(created_by_actor_id:, implicit:, service_account_id:, workspace_id:, workspace_role:, type: :service_account_workspace_member)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaServiceAccountWorkspaceMember} for
          #   more details.
          #
          #   @param created_by_actor_id [String, nil] Tagged ID (`user_...`/`svac_...`) of the actor who created this membership.
          #
          #   @param implicit [Boolean, nil] True when this is the implicit default-workspace membership every service accoun
          #
          #   @param service_account_id [String] Tagged service account ID (`svac_...`).
          #
          #   @param workspace_id [String] Tagged workspace ID (`wrkspc_...`).
          #
          #   @param workspace_role [Symbol, Anthropic::Models::Beta::Organization::BetaWorkspaceRole] Role of the service account in this workspace. Service accounts cannot hold the
          #
          #   @param type [Symbol, :service_account_workspace_member]
        end
      end
    end
  end
end
