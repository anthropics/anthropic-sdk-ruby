# typed: strong

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
                sig do
                  params(
                    project_number: String,
                    betas:
                      T::Array[
                        T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                      ],
                    request_options: Anthropic::RequestOptions::OrHash
                  ).returns(
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectDataControls
                  )
                end
                def retrieve(
                  # The Google Cloud project's number, such as `123456789012`, not its project ID.
                  project_number,
                  # This endpoint is in beta: requests must send
                  # `google-managed-data-controls-2026-09-01` in this header.
                  betas: nil,
                  request_options: {}
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
                sig do
                  params(
                    project_number: String,
                    cmek:
                      T.any(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams::OrHash,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams::OrHash
                      ),
                    storage:
                      T.any(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams::OrHash,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams::OrHash
                      ),
                    betas:
                      T::Array[
                        T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                      ],
                    request_options: Anthropic::RequestOptions::OrHash
                  ).returns(
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectDataControls
                  )
                end
                def update(
                  # Path param: The Google Cloud project's number, such as `123456789012`, not its
                  # project ID.
                  project_number,
                  # Body param: The customer-managed encryption key control. Leave it out to keep
                  # the control as it is. Send `cmek`, `storage`, or both.
                  cmek: nil,
                  # Body param: The customer-owned storage control. Leave it out to keep the control
                  # as it is. Send `cmek`, `storage`, or both.
                  storage: nil,
                  # Header param: This endpoint is in beta: requests must send
                  # `google-managed-data-controls-2026-09-01` in this header.
                  betas: nil,
                  request_options: {}
                )
                end

                # @api private
                sig do
                  params(client: Anthropic::Client).returns(T.attached_class)
                end
                def self.new(client:)
                end
              end
            end
          end
        end
      end
    end
  end
end
