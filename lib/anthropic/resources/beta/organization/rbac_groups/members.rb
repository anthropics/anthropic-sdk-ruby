# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class RBACGroups
          class Members
            # List members of an RBAC Group.
            #
            # The RBAC Groups API is available to Claude Enterprise organizations only.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::RBACGroups::MemberListParams} for more
            # details.
            #
            # @overload list(rbac_group_id, limit: nil, page: nil, request_options: {})
            #
            # @param rbac_group_id [String] ID of the RBAC Group.
            #
            # @param limit [Integer] Number of items to return per page.
            #
            # @param page [String, nil] Optionally set to the `next_page` token from the previous response.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::RBACGroups::BetaRBACGroupMember>]
            #
            # @see Anthropic::Models::Beta::Organization::RBACGroups::MemberListParams
            def list(rbac_group_id, params = {})
              parsed, options = Anthropic::Beta::Organization::RBACGroups::MemberListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: ["v1/organizations/rbac_groups/%1$s/members?beta=true", rbac_group_id],
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::RBACGroups::BetaRBACGroupMember,
                options: options
              )
            end

            # Add a User to an RBAC Group. Membership of groups provisioned by an identity
            # provider (source type `"scim"`) cannot be modified via the API while an
            # organization in the tenant uses SCIM provisioning.
            #
            # The RBAC Groups API is available to Claude Enterprise organizations only.
            #
            # @overload add(rbac_group_id, user_id:, request_options: {})
            #
            # @param rbac_group_id [String] ID of the RBAC Group.
            #
            # @param user_id [String] ID of the User.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::RBACGroups::BetaRBACGroupMember]
            #
            # @see Anthropic::Models::Beta::Organization::RBACGroups::MemberAddParams
            def add(rbac_group_id, params)
              parsed, options = Anthropic::Beta::Organization::RBACGroups::MemberAddParams.dump_request(params)
              @client.request(
                method: :post,
                path: ["v1/organizations/rbac_groups/%1$s/members?beta=true", rbac_group_id],
                body: parsed,
                model: Anthropic::Beta::Organization::RBACGroups::BetaRBACGroupMember,
                options: options
              )
            end

            # Remove a User from an RBAC Group. Membership of groups provisioned by an
            # identity provider (source type `"scim"`) cannot be modified via the API while an
            # organization in the tenant uses SCIM provisioning.
            #
            # The RBAC Groups API is available to Claude Enterprise organizations only.
            #
            # @overload remove(user_id, rbac_group_id:, request_options: {})
            #
            # @param user_id [String] ID of the User.
            #
            # @param rbac_group_id [String] ID of the RBAC Group.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::RBACGroups::MemberRemoveResponse]
            #
            # @see Anthropic::Models::Beta::Organization::RBACGroups::MemberRemoveParams
            def remove(user_id, params)
              parsed, options = Anthropic::Beta::Organization::RBACGroups::MemberRemoveParams.dump_request(params)
              rbac_group_id =
                parsed.delete(:rbac_group_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :delete,
                path: ["v1/organizations/rbac_groups/%1$s/members/%2$s?beta=true", rbac_group_id, user_id],
                model: Anthropic::Models::Beta::Organization::RBACGroups::MemberRemoveResponse,
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
