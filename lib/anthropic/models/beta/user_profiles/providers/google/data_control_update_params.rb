# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # @see Anthropic::Resources::Beta::UserProfiles::Providers::Google::DataControls#update
            class DataControlUpdateParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              # @!attribute user_profile_id
              #   The ID of the user profile whose Google-managed data controls to update
              #   (`uprof_...`).
              #
              #   @return [String]
              required :user_profile_id, String

              # @!attribute cmek
              #   The customer-managed encryption key control. Leave it out to keep the control as
              #   it is. Send `cmek`, `storage`, or both.
              #
              #   @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams, nil]
              optional :cmek,
                       union: -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControlParams }

              # @!attribute storage
              #   The customer-owned storage control. Leave it out to keep the control as it is.
              #   Send `cmek`, `storage`, or both.
              #
              #   @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams, nil]
              optional :storage,
                       union: -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControlParams }

              # @!attribute betas
              #   This endpoint is in beta: requests must send
              #   `google-managed-data-controls-2026-09-01` in this header.
              #
              #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
              optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

              # @!attribute workspace_id
              #   Optional header to select the Workspace for this request. The value is a
              #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
              #
              #   Only needed for credentials that can act on more than one Workspace. A
              #   credential that belongs to a specific Workspace may omit it; if sent, it must
              #   match that Workspace.
              #
              #   @return [String, nil]
              optional :workspace_id, String

              # @!method initialize(user_profile_id:, cmek: nil, storage: nil, betas: nil, workspace_id: nil, request_options: {})
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::DataControlUpdateParams}
              #   for more details.
              #
              #   @param user_profile_id [String] The ID of the user profile whose Google-managed data controls to update (
              #
              #   @param cmek [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams] The customer-managed encryption key control. Leave it out to keep the control as
              #
              #   @param storage [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams] The customer-owned storage control. Leave it out to keep the control as it is. S
              #
              #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
              #
              #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
              #
              #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
            end
          end
        end
      end
    end
  end
end
