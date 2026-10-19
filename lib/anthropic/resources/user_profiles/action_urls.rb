# frozen_string_literal: true

module Anthropic
  module Resources
    class UserProfiles
      class ActionURLs
        # Create Action URL
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::UserProfiles::ActionURLCreateParams} for more details.
        #
        # @overload create(user_profile_id, action:, workspace_id: nil, request_options: {})
        #
        # @param user_profile_id [String] Path param: The ID of the user profile the action is for (`uprof_...`).
        #
        # @param action [Anthropic::Models::UserProfiles::UserProfileEnrollEndUserAction] Body param: The action that the person who opens the URL takes.
        #
        # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::UserProfiles::UserProfileActionURL]
        #
        # @see Anthropic::Models::UserProfiles::ActionURLCreateParams
        def create(user_profile_id, params)
          parsed, options = Anthropic::UserProfiles::ActionURLCreateParams.dump_request(params)
          header_params = {workspace_id: "anthropic-workspace-id"}
          @client.request(
            span_name: Anthropic::Internal::Tracing::SpanName::USER_PROFILES_ACTION_URLS_CREATE,
            span_attributes: {"anthropic.user_profile.id" => user_profile_id},
            span_route: "/v1/user_profiles/{user_profile_id}/action_urls",
            method: :post,
            path: ["v1/user_profiles/%1$s/action_urls", user_profile_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::UserProfiles::UserProfileActionURL,
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
