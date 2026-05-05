# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::UserProfileCreateParams} for more details.
        #
        # Create User Profile
        #
        # @overload create(external_id: nil, metadata: nil, name: nil, relationship: nil, betas: nil, request_options: {})
        #
        # @param external_id [String, nil] Body param: Platform's own identifier for this user. Not enforced unique. Maximu
        #
        # @param metadata [Hash{Symbol=>String}] Body param: Free-form key-value data to attach to this user profile. Maximum 16
        #
        # @param name [String, nil] Body param: Display name of the entity this profile represents. Required when re
        #
        # @param relationship [Symbol, Anthropic::Models::Beta::UserProfileCreateParams::Relationship] Body param: How the entity behind a user profile relates to the platform that ow
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaUserProfile]
        #
        # @see Anthropic::Models::Beta::UserProfileCreateParams
        def create(params = {})
          parsed, options = Anthropic::Beta::UserProfileCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/user_profiles?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaUserProfile,
            options: {extra_headers: {"anthropic-beta" => "user-profiles-2026-03-24"}, **options}
          )
        end

        # Get User Profile
        #
        # @overload retrieve(user_profile_id, betas: nil, request_options: {})
        #
        # @param user_profile_id [String] Path parameter user_profile_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
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
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaUserProfile,
            options: {extra_headers: {"anthropic-beta" => "user-profiles-2026-03-24"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::UserProfileUpdateParams} for more details.
        #
        # Update User Profile
        #
        # @overload update(user_profile_id, external_id: nil, metadata: nil, name: nil, relationship: nil, betas: nil, request_options: {})
        #
        # @param user_profile_id [String] Path param: Path parameter user_profile_id
        #
        # @param external_id [String, nil] Body param: If present, replaces the stored external_id. Omit to leave unchanged
        #
        # @param metadata [Hash{Symbol=>String}] Body param: Key-value pairs to merge into the stored metadata. Keys provided ove
        #
        # @param name [String, nil] Body param: If present, replaces the stored name. Omit to leave unchanged. Maxim
        #
        # @param relationship [Symbol, Anthropic::Models::Beta::UserProfileUpdateParams::Relationship, nil] Body param: How the entity behind a user profile relates to the platform that ow
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaUserProfile]
        #
        # @see Anthropic::Models::Beta::UserProfileUpdateParams
        def update(user_profile_id, params = {})
          parsed, options = Anthropic::Beta::UserProfileUpdateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: ["v1/user_profiles/%1$s?beta=true", user_profile_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaUserProfile,
            options: {extra_headers: {"anthropic-beta" => "user-profiles-2026-03-24"}, **options}
          )
        end

        # List User Profiles
        #
        # @overload list(limit: nil, order: nil, page: nil, betas: nil, request_options: {})
        #
        # @param limit [Integer] Query param: Query parameter for limit
        #
        # @param order [Symbol, Anthropic::Models::Beta::UserProfileListParams::Order] Query param: Query parameter for order
        #
        # @param page [String] Query param: Query parameter for page
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaUserProfile>]
        #
        # @see Anthropic::Models::Beta::UserProfileListParams
        def list(params = {})
          query_params = [:limit, :order, :page]
          parsed, options = Anthropic::Beta::UserProfileListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/user_profiles?beta=true",
            query: query,
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaUserProfile,
            options: {extra_headers: {"anthropic-beta" => "user-profiles-2026-03-24"}, **options}
          )
        end

        # Create Enrollment URL
        #
        # @overload create_enrollment_url(user_profile_id, betas: nil, request_options: {})
        #
        # @param user_profile_id [String] Path parameter user_profile_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
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
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaUserProfileEnrollmentURL,
            options: {extra_headers: {"anthropic-beta" => "user-profiles-2026-03-24"}, **options}
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
