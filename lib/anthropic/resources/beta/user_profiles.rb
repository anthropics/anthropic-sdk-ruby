# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        # Create User Profile
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::UserProfileCreateParams} for more details.
        #
        # @overload create(access_type: nil, external_id: nil, external_user_details: nil, external_user_onboarded_at: nil, metadata: nil, name: nil, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param access_type [Symbol, Anthropic::Models::Beta::UserProfileCreateParams::AccessType] Body param: How the platform uses the API for this entity. `application` (defaul
        #
        # @param external_id [String, nil] Body param: Platform's own identifier for this user. Not enforced unique. Maximu
        #
        # @param external_user_details [Anthropic::Models::Beta::BetaUserProfileExternalUserDetailsParams] Body param: Details about the entity this profile represents, as the platform st
        #
        # @param external_user_onboarded_at [Time] Body param: When the entity this profile represents opened its account with the
        #
        # @param metadata [Hash{Symbol=>String}] Body param: Free-form key-value data to attach to this user profile. Maximum 16
        #
        # @param name [String, nil] Body param: Optional for all profiles. Real-world name of the entity this profil
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaUserProfile]
        #
        # @see Anthropic::Models::Beta::UserProfileCreateParams
        def create(params = {})
          parsed, options = Anthropic::Beta::UserProfileCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
          @client.request(
            method: :post,
            path: "v1/user_profiles?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaUserProfile,
            options: {extra_headers: {"anthropic-beta" => "user-profiles-2026-08-18"}, **options}
          )
        end

        # Get User Profile
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::UserProfileRetrieveParams} for more details.
        #
        # @overload retrieve(user_profile_id, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param user_profile_id [String] The ID of the user profile to get (`uprof_...`).
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaUserProfile]
        #
        # @see Anthropic::Models::Beta::UserProfileRetrieveParams
        def retrieve(user_profile_id, params = {})
          parsed, options = Anthropic::Beta::UserProfileRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/user_profiles/%1$s?beta=true", user_profile_id],
            headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Beta::BetaUserProfile,
            options: {extra_headers: {"anthropic-beta" => "user-profiles-2026-08-18"}, **options}
          )
        end

        # Update User Profile
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::UserProfileUpdateParams} for more details.
        #
        # @overload update(user_profile_id, access_type: nil, external_id: nil, external_user_details: nil, external_user_onboarded_at: nil, metadata: nil, name: nil, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param user_profile_id [String] Path param: The ID of the user profile to update (`uprof_...`).
        #
        # @param access_type [Symbol, Anthropic::Models::Beta::UserProfileUpdateParams::AccessType, nil] Body param: If present, replaces the stored access type. Omit to leave unchanged
        #
        # @param external_id [String, nil] Body param: If present, replaces the stored external_id. Omit to leave unchanged
        #
        # @param external_user_details [Anthropic::Models::Beta::BetaUserProfileExternalUserDetailsParams] Body param: Details about the entity this profile represents, as the platform st
        #
        # @param external_user_onboarded_at [Time] Body param: If present, replaces the stored account creation time. Omit to leave
        #
        # @param metadata [Hash{Symbol=>String}] Body param: Key-value pairs to merge into the stored metadata. Keys provided ove
        #
        # @param name [String, nil] Body param: If present, replaces the stored name. Omit to leave unchanged. Maxim
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaUserProfile]
        #
        # @see Anthropic::Models::Beta::UserProfileUpdateParams
        def update(user_profile_id, params = {})
          parsed, options = Anthropic::Beta::UserProfileUpdateParams.dump_request(params)
          header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
          @client.request(
            method: :post,
            path: ["v1/user_profiles/%1$s?beta=true", user_profile_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaUserProfile,
            options: {extra_headers: {"anthropic-beta" => "user-profiles-2026-08-18"}, **options}
          )
        end

        # List User Profiles
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::UserProfileListParams} for more details.
        #
        # @overload list(limit: nil, order: nil, order_by: nil, page: nil, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param limit [Integer] Query param: The maximum number of user profiles to return, from 1 to 100. Defau
        #
        # @param order [Symbol, Anthropic::Models::Beta::UserProfileListParams::Order] Query param: The sort direction, applied to the field that `order_by` selects. D
        #
        # @param order_by [Symbol, Anthropic::Models::Beta::UserProfileListParams::OrderBy] Query param: The field to sort user profiles by, in the direction that `order` s
        #
        # @param page [String] Query param: The cursor for the page to return, taken from `next_page` in a prev
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaUserProfile>]
        #
        # @see Anthropic::Models::Beta::UserProfileListParams
        def list(params = {})
          query_params = [:limit, :order, :order_by, :page]
          parsed, options = Anthropic::Beta::UserProfileListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/user_profiles?beta=true",
            query: query,
            headers: parsed.except(*query_params).transform_keys(
              betas: "anthropic-beta",
              workspace_id: "anthropic-workspace-id"
            ),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaUserProfile,
            options: {extra_headers: {"anthropic-beta" => "user-profiles-2026-08-18"}, **options}
          )
        end

        # Create Enrollment URL
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::UserProfileCreateEnrollmentURLParams} for more
        # details.
        #
        # @overload create_enrollment_url(user_profile_id, betas: nil, workspace_id: nil, request_options: {})
        #
        # @param user_profile_id [String] The ID of the user profile to create an enrollment URL for (`uprof_...`).
        #
        # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaUserProfileEnrollmentURL]
        #
        # @see Anthropic::Models::Beta::UserProfileCreateEnrollmentURLParams
        def create_enrollment_url(user_profile_id, params = {})
          parsed, options = Anthropic::Beta::UserProfileCreateEnrollmentURLParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/user_profiles/%1$s/enrollment_url?beta=true", user_profile_id],
            headers: parsed.transform_keys(betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"),
            model: Anthropic::Beta::BetaUserProfileEnrollmentURL,
            options: {extra_headers: {"anthropic-beta" => "user-profiles-2026-08-18"}, **options}
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
