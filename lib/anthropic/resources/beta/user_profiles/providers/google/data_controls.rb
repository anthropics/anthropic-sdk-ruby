# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        class Providers
          class Google
            class DataControls
              # Get the profile's encryption keys and storage buckets for Claude on Google
              # Cloud's Agent Platform, with each region's status.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::UserProfiles::Providers::Google::DataControlRetrieveParams}
              # for more details.
              #
              # @overload retrieve(user_profile_id, betas: nil, workspace_id: nil, request_options: {})
              #
              # @param user_profile_id [String] The ID of the user profile whose Google-managed data controls to retrieve (
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
              #
              # @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedDataControls]
              #
              # @see Anthropic::Models::Beta::UserProfiles::Providers::Google::DataControlRetrieveParams
              def retrieve(user_profile_id, params = {})
                parsed, options =
                  Anthropic::Beta::UserProfiles::Providers::Google::DataControlRetrieveParams.dump_request(params)
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::USER_PROFILES_PROVIDERS_GOOGLE_DATA_CONTROLS_RETRIEVE,
                  span_attributes: {"anthropic.user_profile.id" => user_profile_id},
                  span_route: "/v1/user_profiles/{user_profile_id}/providers/google/data_controls",
                  method: :get,
                  path: ["v1/user_profiles/%1$s/providers/google/data_controls", user_profile_id],
                  headers: parsed.transform_keys(
                    betas: "anthropic-beta",
                    workspace_id: "anthropic-workspace-id"
                  ),
                  model: Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedDataControls,
                  options: {
                    extra_headers: {"anthropic-beta" => "user-profiles-2026-09-04,google-managed-data-controls-2026-09-01"},
                    **options
                  }
                )
              end

              # Turn a control on or off, or change the key or bucket set for a region. Controls
              # and regions that you leave out stay as they are.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::UserProfiles::Providers::Google::DataControlUpdateParams}
              # for more details.
              #
              # @overload update(user_profile_id, cmek: nil, storage: nil, betas: nil, workspace_id: nil, request_options: {})
              #
              # @param user_profile_id [String] Path param: The ID of the user profile whose Google-managed data controls to upd
              #
              # @param cmek [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams] Body param: The customer-managed encryption key control. Leave it out to keep th
              #
              # @param storage [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams] Body param: The customer-owned storage control. Leave it out to keep the control
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send
              #
              # @param workspace_id [String] Header param: Optional header to select the Workspace for this request. The valu
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedDataControls]
              #
              # @see Anthropic::Models::Beta::UserProfiles::Providers::Google::DataControlUpdateParams
              def update(user_profile_id, params = {})
                parsed, options =
                  Anthropic::Beta::UserProfiles::Providers::Google::DataControlUpdateParams.dump_request(params)
                header_params = {betas: "anthropic-beta", workspace_id: "anthropic-workspace-id"}
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::USER_PROFILES_PROVIDERS_GOOGLE_DATA_CONTROLS_UPDATE,
                  span_attributes: {"anthropic.user_profile.id" => user_profile_id},
                  span_route: "/v1/user_profiles/{user_profile_id}/providers/google/data_controls",
                  method: :post,
                  path: ["v1/user_profiles/%1$s/providers/google/data_controls", user_profile_id],
                  headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                  body: parsed.except(*header_params.keys),
                  model: Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedDataControls,
                  options: {
                    extra_headers: {"anthropic-beta" => "user-profiles-2026-09-04,google-managed-data-controls-2026-09-01"},
                    **options
                  }
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
end
