# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        class ActionURLs
          # Create Action URL
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::UserProfiles::ActionURLCreateParams} for more details.
          #
          # @overload create(user_profile_id, action:, betas: nil, workspace_id: nil, request_options: {})
          #
          # @param user_profile_id [String] Path param: The ID of the user profile the action is for (`uprof_...`).
          #
          # @param action [Anthropic::Models::Beta::UserProfiles::BetaUserProfileEnrollEndUserAction] Body param: The action that the person who opens the URL takes.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::UserProfiles::BetaUserProfileActionURL]
          #
          # @see Anthropic::Models::Beta::UserProfiles::ActionURLCreateParams
          def create(user_profile_id, params)
            parsed, options = Anthropic::Beta::UserProfiles::ActionURLCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::USER_PROFILES_ACTION_URLS_CREATE,
              span_attributes: {"anthropic.user_profile.id" => user_profile_id},
              span_route: "/v1/user_profiles/{user_profile_id}/action_urls",
              method: :post,
              path: ["v1/user_profiles/%1$s/action_urls?beta=true", user_profile_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::UserProfiles::BetaUserProfileActionURL,
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
end
