# frozen_string_literal: true

module Anthropic
  module Resources
    class UserProfiles
      # @return [Anthropic::Resources::UserProfiles::ActionURLs]
      attr_reader :action_urls

      # Create User Profile
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::UserProfileCreateParams} for more details.
      #
      # @overload create(access_type: nil, external_user_details: nil, metadata: nil, name: nil, workspace_id: nil, request_options: {})
      #
      # @param access_type [Symbol, Anthropic::Models::UserProfileAccessType] Body param: How the platform uses the API for this entity. `application` (defaul
      #
      # @param external_user_details [Anthropic::Models::UserProfileExternalUserDetailsParams] Body param: Details about the entity this profile represents, as the platform st
      #
      # @param metadata [Hash{Symbol=>String}] Body param: Free-form key-value data to attach to this user profile. Maximum 16
      #
      # @param name [String, nil] Body param: Optional for all profiles. Real-world name of the entity this profil
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::UserProfile]
      #
      # @see Anthropic::Models::UserProfileCreateParams
      def create(params = {})
        parsed, options = Anthropic::UserProfileCreateParams.dump_request(params)
        header_params = {workspace_id: "anthropic-workspace-id"}
        @client.request(
          span_name: Anthropic::Internal::Tracing::SpanName::USER_PROFILES_CREATE,
          span_created_id: "anthropic.user_profile.id",
          span_route: "/v1/user_profiles",
          method: :post,
          path: "v1/user_profiles",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Anthropic::UserProfile,
          options: options
        )
      end

      # Get User Profile
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::UserProfileRetrieveParams} for more details.
      #
      # @overload retrieve(user_profile_id, workspace_id: nil, request_options: {})
      #
      # @param user_profile_id [String] The ID of the user profile to get (`uprof_...`).
      #
      # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::UserProfile]
      #
      # @see Anthropic::Models::UserProfileRetrieveParams
      def retrieve(user_profile_id, params = {})
        parsed, options = Anthropic::UserProfileRetrieveParams.dump_request(params)
        @client.request(
          span_name: Anthropic::Internal::Tracing::SpanName::USER_PROFILES_RETRIEVE,
          span_attributes: {"anthropic.user_profile.id" => user_profile_id},
          span_route: "/v1/user_profiles/{user_profile_id}",
          method: :get,
          path: ["v1/user_profiles/%1$s", user_profile_id],
          headers: parsed.transform_keys(workspace_id: "anthropic-workspace-id"),
          model: Anthropic::UserProfile,
          options: options
        )
      end

      # Update User Profile
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::UserProfileUpdateParams} for more details.
      #
      # @overload update(user_profile_id, access_type: nil, external_user_details: nil, metadata: nil, name: nil, workspace_id: nil, request_options: {})
      #
      # @param user_profile_id [String] Path param: The ID of the user profile to update (`uprof_...`).
      #
      # @param access_type [Symbol, Anthropic::Models::UserProfileAccessType, nil] Body param: If present, replaces the stored access type. Omit to leave unchanged
      #
      # @param external_user_details [Anthropic::Models::UserProfileExternalUserDetailsParams] Body param: Details about the entity this profile represents, as the platform st
      #
      # @param metadata [Hash{Symbol=>String}] Body param: Key-value pairs to merge into the stored metadata. Keys provided ove
      #
      # @param name [String, nil] Body param: If present, replaces the stored name. Omit to leave unchanged. Maxim
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::UserProfile]
      #
      # @see Anthropic::Models::UserProfileUpdateParams
      def update(user_profile_id, params = {})
        parsed, options = Anthropic::UserProfileUpdateParams.dump_request(params)
        header_params = {workspace_id: "anthropic-workspace-id"}
        @client.request(
          span_name: Anthropic::Internal::Tracing::SpanName::USER_PROFILES_UPDATE,
          span_attributes: {"anthropic.user_profile.id" => user_profile_id},
          span_route: "/v1/user_profiles/{user_profile_id}",
          method: :post,
          path: ["v1/user_profiles/%1$s", user_profile_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Anthropic::UserProfile,
          options: options
        )
      end

      # List User Profiles
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::UserProfileListParams} for more details.
      #
      # @overload list(limit: nil, order: nil, order_by: nil, page: nil, workspace_id: nil, request_options: {})
      #
      # @param limit [Integer] Query param: The maximum number of user profiles to return, from 1 to 100. Defau
      #
      # @param order [Symbol, Anthropic::Models::UserProfileListOrder] Query param: The sort direction, applied to the field that `order_by` selects. D
      #
      # @param order_by [Symbol, Anthropic::Models::UserProfileListOrderBy] Query param: The field to sort user profiles by, in the direction that `order` s
      #
      # @param page [String] Query param: The cursor for the page to return, taken from `next_page` in a prev
      #
      # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Internal::PageCursor<Anthropic::Models::UserProfile>]
      #
      # @see Anthropic::Models::UserProfileListParams
      def list(params = {})
        query_params = [:limit, :order, :order_by, :page]
        parsed, options = Anthropic::UserProfileListParams.dump_request(params)
        query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
        @client.request(
          span_name: Anthropic::Internal::Tracing::SpanName::USER_PROFILES_LIST,
          span_route: "/v1/user_profiles",
          span_query: %w[limit order order_by page],
          method: :get,
          path: "v1/user_profiles",
          query: query,
          headers: parsed.except(*query_params).transform_keys(workspace_id: "anthropic-workspace-id"),
          page: Anthropic::Internal::PageCursor,
          model: Anthropic::UserProfile,
          options: options
        )
      end

      # Delete User Profile
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::UserProfileDeleteParams} for more details.
      #
      # @overload delete(user_profile_id, workspace_id: nil, request_options: {})
      #
      # @param user_profile_id [String] The ID of the user profile to delete (`uprof_...`).
      #
      # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::DeletedUserProfile]
      #
      # @see Anthropic::Models::UserProfileDeleteParams
      def delete(user_profile_id, params = {})
        parsed, options = Anthropic::UserProfileDeleteParams.dump_request(params)
        @client.request(
          span_name: Anthropic::Internal::Tracing::SpanName::USER_PROFILES_DELETE,
          span_attributes: {"anthropic.user_profile.id" => user_profile_id},
          span_route: "/v1/user_profiles/{user_profile_id}",
          method: :delete,
          path: ["v1/user_profiles/%1$s", user_profile_id],
          headers: parsed.transform_keys(workspace_id: "anthropic-workspace-id"),
          model: Anthropic::DeletedUserProfile,
          options: options
        )
      end

      # @api private
      #
      # @param client [Anthropic::Client]
      def initialize(client:)
        @client = client
        @action_urls = Anthropic::Resources::UserProfiles::ActionURLs.new(client: client)
      end
    end
  end
end
