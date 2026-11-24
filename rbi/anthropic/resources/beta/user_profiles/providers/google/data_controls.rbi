# typed: strong

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        class Providers
          class Google
            class DataControls
              # Get the profile's encryption keys and storage buckets for Claude on Google
              # Cloud's Agent Platform, with each region's status.
              sig do
                params(
                  user_profile_id: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  workspace_id: String,
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedDataControls
                )
              end
              def retrieve(
                # The ID of the user profile whose Google-managed data controls to retrieve
                # (`uprof_...`).
                user_profile_id,
                # This endpoint is in beta: requests must send
                # `google-managed-data-controls-2026-09-01` in this header.
                betas: nil,
                # Optional header to select the Workspace for this request. The value is a
                # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
                #
                # Only needed for credentials that can act on more than one Workspace. A
                # credential that belongs to a specific Workspace may omit it; if sent, it must
                # match that Workspace.
                workspace_id: nil,
                request_options: {}
              )
              end

              # Turn a control on or off, or change the key or bucket set for a region. Controls
              # and regions that you leave out stay as they are.
              sig do
                params(
                  user_profile_id: String,
                  cmek:
                    T.any(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams::OrHash,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams::OrHash
                    ),
                  storage:
                    T.any(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams::OrHash,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams::OrHash
                    ),
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  workspace_id: String,
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedDataControls
                )
              end
              def update(
                # Path param: The ID of the user profile whose Google-managed data controls to
                # update (`uprof_...`).
                user_profile_id,
                # Body param: The customer-managed encryption key control. Leave it out to keep
                # the control as it is. Send `cmek`, `storage`, or both.
                cmek: nil,
                # Body param: The customer-owned storage control. Leave it out to keep the control
                # as it is. Send `cmek`, `storage`, or both.
                storage: nil,
                # Header param: This endpoint is in beta: requests must send
                # `google-managed-data-controls-2026-09-01` in this header.
                betas: nil,
                # Header param: Optional header to select the Workspace for this request. The
                # value is a Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
                #
                # Only needed for credentials that can act on more than one Workspace. A
                # credential that belongs to a specific Workspace may omit it; if sent, it must
                # match that Workspace.
                workspace_id: nil,
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
