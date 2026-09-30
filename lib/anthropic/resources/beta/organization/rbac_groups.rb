# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class RBACGroups
          # @return [Anthropic::Resources::Beta::Organization::RBACGroups::Members]
          attr_reader :members

          # Create an RBAC Group in the Claude Enterprise tenant. Groups created via the API
          # have source type `"direct"`.
          #
          # The RBAC Groups API is available to Claude Enterprise organizations only.
          #
          # @overload create(name:, request_options: {})
          #
          # @param name [String] Name of the RBAC Group. Not uniqueness-enforced.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaRBACGroup]
          #
          # @see Anthropic::Models::Beta::Organization::RBACGroupCreateParams
          def create(params)
            parsed, options = Anthropic::Beta::Organization::RBACGroupCreateParams.dump_request(params)
            @client.request(
              method: :post,
              path: "v1/organizations/rbac_groups?beta=true",
              body: parsed,
              model: Anthropic::Beta::Organization::BetaRBACGroup,
              options: options
            )
          end

          # Retrieve an RBAC Group by ID.
          #
          # The RBAC Groups API is available to Claude Enterprise organizations only.
          #
          # @overload retrieve(rbac_group_id, request_options: {})
          #
          # @param rbac_group_id [String] ID of the RBAC Group.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaRBACGroup]
          #
          # @see Anthropic::Models::Beta::Organization::RBACGroupRetrieveParams
          def retrieve(rbac_group_id, params = {})
            @client.request(
              method: :get,
              path: ["v1/organizations/rbac_groups/%1$s?beta=true", rbac_group_id],
              model: Anthropic::Beta::Organization::BetaRBACGroup,
              options: params[:request_options]
            )
          end

          # Update an RBAC Group's name. Groups provisioned by an identity provider (source
          # type `"scim"`) cannot be modified via the API while an organization in the
          # tenant uses SCIM provisioning.
          #
          # The RBAC Groups API is available to Claude Enterprise organizations only.
          #
          # @overload update(rbac_group_id, name: nil, request_options: {})
          #
          # @param rbac_group_id [String] ID of the RBAC Group.
          #
          # @param name [String, nil] Name of the RBAC Group. Not uniqueness-enforced.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaRBACGroup]
          #
          # @see Anthropic::Models::Beta::Organization::RBACGroupUpdateParams
          def update(rbac_group_id, params = {})
            parsed, options = Anthropic::Beta::Organization::RBACGroupUpdateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/organizations/rbac_groups/%1$s?beta=true", rbac_group_id],
              body: parsed,
              model: Anthropic::Beta::Organization::BetaRBACGroup,
              options: options
            )
          end

          # List RBAC Groups in the Claude Enterprise tenant.
          #
          # The RBAC Groups API is available to Claude Enterprise organizations only.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::RBACGroupListParams} for more details.
          #
          # @overload list(limit: nil, page: nil, request_options: {})
          #
          # @param limit [Integer] Number of items to return per page.
          #
          # @param page [String, nil] Optionally set to the `next_page` token from the previous response.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaRBACGroup>]
          #
          # @see Anthropic::Models::Beta::Organization::RBACGroupListParams
          def list(params = {})
            parsed, options = Anthropic::Beta::Organization::RBACGroupListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "v1/organizations/rbac_groups?beta=true",
              query: query,
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Organization::BetaRBACGroup,
              options: options
            )
          end

          # Delete an RBAC Group. Groups provisioned by an identity provider (source type
          # `"scim"`) cannot be deleted via the API while an organization in the tenant uses
          # SCIM provisioning.
          #
          # The RBAC Groups API is available to Claude Enterprise organizations only.
          #
          # @overload delete(rbac_group_id, request_options: {})
          #
          # @param rbac_group_id [String] ID of the RBAC Group.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::RBACGroupDeleteResponse]
          #
          # @see Anthropic::Models::Beta::Organization::RBACGroupDeleteParams
          def delete(rbac_group_id, params = {})
            @client.request(
              method: :delete,
              path: ["v1/organizations/rbac_groups/%1$s?beta=true", rbac_group_id],
              model: Anthropic::Models::Beta::Organization::RBACGroupDeleteResponse,
              options: params[:request_options]
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @members = Anthropic::Resources::Beta::Organization::RBACGroups::Members.new(client: client)
          end
        end
      end
    end
  end
end
