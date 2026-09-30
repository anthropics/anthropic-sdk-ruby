# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class RBACRoles
          class Permissions
            # List the permissions an RBAC Role grants.
            #
            # The RBAC Roles API is available to Claude Enterprise organizations only.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::RBACRoles::PermissionListParams} for
            # more details.
            #
            # @overload list(rbac_role_id, limit: nil, page: nil, request_options: {})
            #
            # @param rbac_role_id [String] ID of the RBAC Role.
            #
            # @param limit [Integer] Number of items to return per page.
            #
            # @param page [String, nil] Optionally set to the `next_page` token from the previous response.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACRolePermission>]
            #
            # @see Anthropic::Models::Beta::Organization::RBACRoles::PermissionListParams
            def list(rbac_role_id, params = {})
              parsed, options = Anthropic::Beta::Organization::RBACRoles::PermissionListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: ["v1/organizations/rbac_roles/%1$s/permissions?beta=true", rbac_role_id],
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission,
                options: options
              )
            end

            # @api private
            #
            # @param client [Anthropic::Client]
            def initialize(client:)
              @client = client
            end
          end
        end
      end
    end
  end
end
