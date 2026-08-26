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
              method: :get,
              path: ["v1/organizations/users/%1$s?beta=true", user_id],
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
              method: :post,
              path: ["v1/organizations/users/%1$s?beta=true", user_id],
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
              method: :get,
              path: "v1/organizations/users?beta=true",
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
          # @return [Anthropic::Models::Beta::Organization::UserRemoveResponse]
          #
          # @see Anthropic::Models::Beta::Organization::UserRemoveParams
          def remove(user_id, params = {})
            @client.request(
              method: :delete,
              path: ["v1/organizations/users/%1$s?beta=true", user_id],
              model: Anthropic::Models::Beta::Organization::UserRemoveResponse,
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
end
