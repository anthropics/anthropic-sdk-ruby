# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Users
          # Retrieve a member of the organization by user ID.
          #
          # @overload retrieve(user_id, request_options: {})
          #
          # @param user_id [String] ID of the User.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaOrganizationUser]
          #
          # @see Anthropic::Models::Beta::Organization::UserRetrieveParams
          def retrieve(user_id, params = {})
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_USERS_RETRIEVE,
              span_attributes: {"anthropic.organization.user.id" => user_id},
              span_route: "/v1/organizations/users/{user_id}",
              method: :get,
              path: ["v1/organizations/users/%1$s", user_id],
              model: Anthropic::Beta::Organization::BetaOrganizationUser,
              options: params[:request_options]
            )
          end

          # Update a member's organization role.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::UserUpdateParams} for more details.
          #
          # @overload update(user_id, role:, request_options: {})
          #
          # @param user_id [String] ID of the User.
          #
          # @param role [Symbol, Anthropic::Models::Beta::Organization::UserUpdateParams::Role] New role for the User.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaOrganizationUser]
          #
          # @see Anthropic::Models::Beta::Organization::UserUpdateParams
          def update(user_id, params)
            parsed, options = Anthropic::Beta::Organization::UserUpdateParams.dump_request(params)
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_USERS_UPDATE,
              span_attributes: {"anthropic.organization.user.id" => user_id},
              span_route: "/v1/organizations/users/{user_id}",
              method: :post,
              path: ["v1/organizations/users/%1$s", user_id],
              body: parsed,
              model: Anthropic::Beta::Organization::BetaOrganizationUser,
              options: options
            )
          end

          # List the organization's members.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::UserListParams} for more details.
          #
          # @overload list(after_id: nil, before_id: nil, email: nil, limit: nil, roles: nil, request_options: {})
          #
          # @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          # @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          # @param email [String] Filter by user email.
          #
          # @param limit [Integer] Number of items to return per page.
          #
          # @param roles [Array<String>] Filter to items whose `role` equals one of the supplied values. Repeatable; valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::Page<Anthropic::Models::Beta::Organization::BetaOrganizationUser>]
          #
          # @see Anthropic::Models::Beta::Organization::UserListParams
          def list(params = {})
            parsed, options = Anthropic::Beta::Organization::UserListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_USERS_LIST,
              span_route: "/v1/organizations/users",
              span_query: %w[after_id before_id email limit roles],
              method: :get,
              path: "v1/organizations/users",
              query: query,
              page: Anthropic::Internal::Page,
              model: Anthropic::Beta::Organization::BetaOrganizationUser,
              options: options
            )
          end

          # Remove a member from the organization.
          #
          # @overload remove(user_id, request_options: {})
          #
          # @param user_id [String] ID of the User.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::Organization::CannotRemoveLastMemberError]
          # @raise [Anthropic::Models::ConcurrentMembershipChangeError]
          #
          # @return [Anthropic::Models::Beta::Organization::UserRemoveResponse]
          #
          # @see Anthropic::Models::Beta::Organization::UserRemoveParams
          def remove(user_id, params = {})
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_USERS_REMOVE,
              span_attributes: {"anthropic.organization.user.id" => user_id},
              span_route: "/v1/organizations/users/{user_id}",
              method: :delete,
              path: ["v1/organizations/users/%1$s", user_id],
              model: Anthropic::Models::Beta::Organization::UserRemoveResponse,
              options: params[:request_options]
            )
          end

          # Sign a member out of Claude everywhere, without removing them from the
          # organization. This ends their sign-in sessions and removes their trusted devices
          # wherever they use Claude, including other organizations and individual plans. It
          # also ends the OAuth tokens issued to them for this organization, so apps such as
          # Claude Code must sign in again.
          #
          # A token can take up to an hour to stop working, though it almost always stops at
          # once. The member keeps their role and can sign in again right away. To keep them
          # out, remove them from the organization or, if your organization uses single
          # sign-on, block them in your identity provider. Signing out does not end API
          # keys, OAuth tokens that were not issued for this organization, or the member's
          # Claude Code cloud sessions and routines.
          #
          # You cannot sign out the organization's primary owner or the person your API key
          # or token acts for, and a request to sign out another owner, a member with owner
          # permissions, or a membership admin may be refused. A refused request returns a
          # `400` or `403` error that says why. If the request returns `503`, send it again
          # to finish; anything already ended stays ended.
          #
          # Every request must include the beta header
          # `anthropic-beta: admin-user-sign-out-2026-10-08`. A request without it returns
          # `400`. Sign-out is in beta. Anthropic turns it on for each organization and has
          # turned it on for every Claude Enterprise organization; until yours is on,
          # requests also return `400`. In a Claude Enterprise organization, an API key
          # needs the `write:members` scope; a key without it gets `403`.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::UserSignOutParams} for more details.
          #
          # @overload sign_out(user_id, betas: nil, request_options: {})
          #
          # @param user_id [String] ID of the User.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `admin-user-sign-out-2026-10-08` in
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::Beta::Organization::BetaCannotSignOutPrimaryOwnerError]
          # @raise [Anthropic::Models::Beta::Organization::BetaCannotSignOutSelfError]
          # @raise [Anthropic::Models::BetaOrganizationNotEnrolledInBetaError]
          # @raise [Anthropic::Models::Beta::Organization::BetaCannotSignOutManagedMemberError]
          # @raise [Anthropic::Models::Beta::Organization::BetaCannotSignOutMembershipAdminError]
          # @raise [Anthropic::Models::Beta::Organization::BetaCannotSignOutOwnerError]
          # @raise [Anthropic::Models::Beta::Organization::BetaCannotSignOutPrivilegedMemberError]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaOrganizationUser]
          #
          # @see Anthropic::Models::Beta::Organization::UserSignOutParams
          def sign_out(user_id, params = {})
            parsed, options = Anthropic::Beta::Organization::UserSignOutParams.dump_request(params)
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_USERS_SIGN_OUT,
              span_attributes: {"anthropic.organization.user.id" => user_id},
              span_route: "/v1/organizations/users/{user_id}/sign_out",
              method: :post,
              path: ["v1/organizations/users/%1$s/sign_out", user_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaOrganizationUser,
              options: {extra_headers: {"anthropic-beta" => "admin-user-sign-out-2026-10-08"}, **options}
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
