# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class DataControlUpdateParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::DataControlUpdateParams,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The ID of the user profile whose Google-managed data controls to update
              # (`uprof_...`).
              sig { returns(String) }
              attr_accessor :user_profile_id

              # The customer-managed encryption key control. Leave it out to keep the control as
              # it is. Send `cmek`, `storage`, or both.
              sig do
                returns(
                  T.nilable(
                    T.any(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams
                    )
                  )
                )
              end
              attr_reader :cmek

              sig do
                params(
                  cmek:
                    T.any(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams::OrHash,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams::OrHash
                    )
                ).void
              end
              attr_writer :cmek

              # The customer-owned storage control. Leave it out to keep the control as it is.
              # Send `cmek`, `storage`, or both.
              sig do
                returns(
                  T.nilable(
                    T.any(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams
                    )
                  )
                )
              end
              attr_reader :storage

              sig do
                params(
                  storage:
                    T.any(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams::OrHash,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams::OrHash
                    )
                ).void
              end
              attr_writer :storage

              # This endpoint is in beta: requests must send
              # `google-managed-data-controls-2026-09-01` in this header.
              sig do
                returns(
                  T.nilable(
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
                  )
                )
              end
              attr_reader :betas

              sig do
                params(
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
                ).void
              end
              attr_writer :betas

              # Optional header to select the Workspace for this request. The value is a
              # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
              #
              # Only needed for credentials that can act on more than one Workspace. A
              # credential that belongs to a specific Workspace may omit it; if sent, it must
              # match that Workspace.
              sig { returns(T.nilable(String)) }
              attr_reader :workspace_id

              sig { params(workspace_id: String).void }
              attr_writer :workspace_id

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
                ).returns(T.attached_class)
              end
              def self.new(
                # The ID of the user profile whose Google-managed data controls to update
                # (`uprof_...`).
                user_profile_id:,
                # The customer-managed encryption key control. Leave it out to keep the control as
                # it is. Send `cmek`, `storage`, or both.
                cmek: nil,
                # The customer-owned storage control. Leave it out to keep the control as it is.
                # Send `cmek`, `storage`, or both.
                storage: nil,
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

              sig do
                override.returns(
                  {
                    user_profile_id: String,
                    cmek:
                      T.any(
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams
                      ),
                    storage:
                      T.any(
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams,
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams
                      ),
                    betas:
                      T::Array[
                        T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                      ],
                    workspace_id: String,
                    request_options: Anthropic::RequestOptions
                  }
                )
              end
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
