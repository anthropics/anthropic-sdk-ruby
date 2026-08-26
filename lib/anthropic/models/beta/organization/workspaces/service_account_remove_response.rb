# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          # @see Anthropic::Resources::Beta::Organization::Workspaces::ServiceAccounts#remove
          class ServiceAccountRemoveResponse < Anthropic::Internal::Type::BaseModel
            # @!attribute service_account_id
            #   Tagged service account ID (`svac_...`) named in the delete request. Removal is
            #   idempotent; see the endpoint description for the implicit-membership no-op.
            #
            #   @return [String]
            required :service_account_id, String

            # @!attribute type
            #
            #   @return [Symbol, :service_account_workspace_member_deleted]
            required :type, const: :service_account_workspace_member_deleted

            # @!attribute workspace_id
            #   Tagged workspace ID (`wrkspc_...`) named in the delete request.
            #
            #   @return [String]
            required :workspace_id, String

            # @!method initialize(service_account_id:, workspace_id:, type: :service_account_workspace_member_deleted)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Workspaces::ServiceAccountRemoveResponse}
            #   for more details.
            #
            #   @param service_account_id [String] Tagged service account ID (`svac_...`) named in the delete request. Removal is i
            #
            #   @param workspace_id [String] Tagged workspace ID (`wrkspc_...`) named in the delete request.
            #
            #   @param type [Symbol, :service_account_workspace_member_deleted]
          end
        end
      end
    end
  end
end
