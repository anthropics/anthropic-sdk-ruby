# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class Invites
        # Invite a user to join the organization by email.
        #
        # On plans that draw members from a finite pool of purchased seats, the invite
        # automatically consumes a seat from the lowest tier with availability; there is
        # no seat-tier parameter. When no seat is free the request fails with a 400 error
        # rather than purchasing a seat.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Organization::InviteCreateParams} for more details.
        #
        # @overload create(email:, role:, rbac_group_ids: nil, request_options: {})
        #
        # @param email [String] Email of the User.
        #
        # @param role [Symbol, Anthropic::Models::Organization::InviteCreateParams::Role] Role for the invited User.
        #
        # @param rbac_group_ids [Array<String>] RBAC group IDs to assign to the User when the Invite is accepted. A non-empty ar
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::OrganizationInvite]
        #
        # @see Anthropic::Models::Organization::InviteCreateParams
        def create(params)
          parsed, options = Anthropic::Organization::InviteCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/organizations/invites",
            body: parsed,
            model: Anthropic::Organization::OrganizationInvite,
            options: options
          )
        end

        # Retrieve an invite by ID.
        #
        # @overload retrieve(invite_id, request_options: {})
        #
        # @param invite_id [String] ID of the Invite.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::OrganizationInvite]
        #
        # @see Anthropic::Models::Organization::InviteRetrieveParams
        def retrieve(invite_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/organizations/invites/%1$s", invite_id],
            model: Anthropic::Organization::OrganizationInvite,
            options: params[:request_options]
          )
        end

        # List the organization's invites.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Organization::InviteListParams} for more details.
        #
        # @overload list(after_id: nil, before_id: nil, email: nil, limit: nil, roles: nil, statuses: nil, request_options: {})
        #
        # @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
        #
        # @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
        #
        # @param email [String] Filter by the email address the Invite was sent to. Matches the same way as the
        #
        # @param limit [Integer] Number of items to return per page.
        #
        # @param roles [Array<String>] Filter to items whose `role` equals one of the supplied values. Repeatable; valu
        #
        # @param statuses [Array<Symbol, Anthropic::Models::Organization::InviteListParams::Status>] Filter by Invite status. Repeatable; values are OR'ed together. Omit to return `
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::Page<Anthropic::Models::Organization::OrganizationInvite>]
        #
        # @see Anthropic::Models::Organization::InviteListParams
        def list(params = {})
          parsed, options = Anthropic::Organization::InviteListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "v1/organizations/invites",
            query: query,
            page: Anthropic::Internal::Page,
            model: Anthropic::Organization::OrganizationInvite,
            options: options
          )
        end

        # Delete a pending invite.
        #
        # @overload delete(invite_id, request_options: {})
        #
        # @param invite_id [String] ID of the Invite.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::InviteDeleteResponse]
        #
        # @see Anthropic::Models::Organization::InviteDeleteParams
        def delete(invite_id, params = {})
          @client.request(
            method: :delete,
            path: ["v1/organizations/invites/%1$s", invite_id],
            model: Anthropic::Models::Organization::InviteDeleteResponse,
            options: params[:request_options]
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
