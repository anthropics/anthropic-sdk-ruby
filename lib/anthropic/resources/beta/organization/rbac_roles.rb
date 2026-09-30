# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class RBACRoles
          # @return [Anthropic::Resources::Beta::Organization::RBACRoles::Permissions]
          attr_reader :permissions

          # Retrieve an RBAC Role by ID.
          #
          # The RBAC Roles API is available to Claude Enterprise organizations only.
          #
          # @overload retrieve(rbac_role_id, request_options: {})
          #
          # @param rbac_role_id [String] ID of the RBAC Role.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaRBACRole]
          #
          # @see Anthropic::Models::Beta::Organization::RBACRoleRetrieveParams
          def retrieve(rbac_role_id, params = {})
            @client.request(
              method: :get,
              path: ["v1/organizations/rbac_roles/%1$s?beta=true", rbac_role_id],
              model: Anthropic::Beta::Organization::BetaRBACRole,
              options: params[:request_options]
            )
          end

          # List RBAC Roles in the organization.
          #
          # The RBAC Roles API is available to Claude Enterprise organizations only.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::RBACRoleListParams} for more details.
          #
          # @overload list(limit: nil, page: nil, request_options: {})
          #
          # @param limit [Integer] Number of items to return per page.
          #
          # @param page [String, nil] Optionally set to the `next_page` token from the previous response.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaRBACRole>]
          #
          # @see Anthropic::Models::Beta::Organization::RBACRoleListParams
          def list(params = {})
            parsed, options = Anthropic::Beta::Organization::RBACRoleListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "v1/organizations/rbac_roles?beta=true",
              query: query,
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Organization::BetaRBACRole,
              options: options
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @permissions = Anthropic::Resources::Beta::Organization::RBACRoles::Permissions.new(client: client)
          end
        end
      end
    end
  end
end
