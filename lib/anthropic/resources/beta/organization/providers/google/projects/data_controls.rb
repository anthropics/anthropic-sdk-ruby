# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Providers
          class Google
            class Projects
              class DataControls
                # Get a Google Cloud project's encryption keys and storage buckets for Claude on
                # Google Cloud's Agent Platform, with each region's status.
                #
                # Your organization must have proved that it owns the project.
                #
                # Some parameter documentations has been truncated, see
                # {Anthropic::Models::Beta::Organization::Providers::Google::Projects::DataControlRetrieveParams}
                # for more details.
                #
                # @overload retrieve(project_number, betas: nil, request_options: {})
                #
                # @param project_number [String] The Google Cloud project's number, such as `123456789012`, not its project ID.
                #
                # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
                #
                # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
                #
                # @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectDataControls]
                #
                # @see Anthropic::Models::Beta::Organization::Providers::Google::Projects::DataControlRetrieveParams
                def retrieve(project_number, params = {})
                  parsed, options =
                    Anthropic::Beta::Organization::Providers::Google::Projects::DataControlRetrieveParams.dump_request(params)
                  @client.request(
                    qualifiers: {beta: "true"},
                    span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_PROVIDERS_GOOGLE_PROJECTS_DATA_CONTROLS_RETRIEVE,
                    span_attributes: {"anthropic.organization.provider.google.project.id" => project_number},
                    span_route: "/v1/organizations/providers/google/projects/{project_number}/data_controls",
                    method: :get,
                    path: ["v1/organizations/providers/google/projects/%1$s/data_controls", project_number],
                    headers: parsed.transform_keys(betas: "anthropic-beta"),
                    model: Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectDataControls,
                    options: {
                      extra_headers: {"anthropic-beta" => "google-managed-data-controls-2026-09-01"},
                      **options
                    }
                  )
                end

                # Turn a control on or off, or change the key or bucket set for a region. Controls
                # and regions that you leave out stay as they are.
                #
                # Your organization must have proved that it owns the project. Only one
                # organization at a time can have controls turned on for a project.
                #
                # **Requires a credential that identifies a user or a service account**: an OAuth
                # access token with the `org:admin` scope, or an organization-scoped API key that
                # belongs to a user or service account whose organization role can update these
                # controls. The `admin`, `owner` and `primary_owner` roles can. An Admin API key
                # gets a `403` error.
                #
                # Some parameter documentations has been truncated, see
                # {Anthropic::Models::Beta::Organization::Providers::Google::Projects::DataControlUpdateParams}
                # for more details.
                #
                # @overload update(project_number, cmek: nil, storage: nil, betas: nil, request_options: {})
                #
                # @param project_number [String] Path param: The Google Cloud project's number, such as `123456789012`, not its p
                #
                # @param cmek [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams] Body param: The customer-managed encryption key control. Leave it out to keep th
                #
                # @param storage [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams] Body param: The customer-owned storage control. Leave it out to keep the control
                #
                # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send
                #
                # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
                #
                # @raise [Anthropic::Models::BetaCMEKNotApprovedError]
                # @raise [Anthropic::Models::BetaExternalKeyNotFoundError]
                # @raise [Anthropic::Models::BetaExternalKeyProviderMismatchError]
                # @raise [Anthropic::Models::BetaGCPProjectNotVerifiedError]
                # @raise [Anthropic::Models::Organization::KeyProfileMismatchError]
                # @raise [Anthropic::Models::Beta::BetaOrganizationNotEligibleError]
                # @raise [Anthropic::Models::BetaRegionNotSupportedError]
                # @raise [Anthropic::Models::BetaStorageNotApprovedError]
                # @raise [Anthropic::Models::SandboxEgressRestrictedError]
                # @raise [Anthropic::Models::BetaGCPProjectControlledByAnotherOrganizationError]
                # @raise [Anthropic::Models::BetaStorageInUseError]
                # @raise [Anthropic::Models::Beta::BetaAuthorizationCheckUnavailableError]
                #
                # @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectDataControls]
                #
                # @see Anthropic::Models::Beta::Organization::Providers::Google::Projects::DataControlUpdateParams
                def update(project_number, params = {})
                  parsed, options =
                    Anthropic::Beta::Organization::Providers::Google::Projects::DataControlUpdateParams.dump_request(params)
                  header_params = {betas: "anthropic-beta"}
                  @client.request(
                    qualifiers: {beta: "true"},
                    span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_PROVIDERS_GOOGLE_PROJECTS_DATA_CONTROLS_UPDATE,
                    span_attributes: {"anthropic.organization.provider.google.project.id" => project_number},
                    span_route: "/v1/organizations/providers/google/projects/{project_number}/data_controls",
                    method: :post,
                    path: ["v1/organizations/providers/google/projects/%1$s/data_controls", project_number],
                    headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                    body: parsed.except(*header_params.keys),
                    model: Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectDataControls,
                    options: {
                      extra_headers: {"anthropic-beta" => "google-managed-data-controls-2026-09-01"},
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
end
