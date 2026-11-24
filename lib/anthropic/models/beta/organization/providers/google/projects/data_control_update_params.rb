# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              # @see Anthropic::Resources::Beta::Organization::Providers::Google::Projects::DataControls#update
              class DataControlUpdateParams < Anthropic::Internal::Type::BaseModel
                extend Anthropic::Internal::Type::RequestParameters::Converter
                include Anthropic::Internal::Type::RequestParameters

                # @!attribute project_number
                #   The Google Cloud project's number, such as `123456789012`, not its project ID.
                #
                #   @return [String]
                required :project_number, String

                # @!attribute cmek
                #   The customer-managed encryption key control. Leave it out to keep the control as
                #   it is. Send `cmek`, `storage`, or both.
                #
                #   @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams, nil]
                optional :cmek,
                         union: -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControlParams }

                # @!attribute storage
                #   The customer-owned storage control. Leave it out to keep the control as it is.
                #   Send `cmek`, `storage`, or both.
                #
                #   @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams, nil]
                optional :storage,
                         union: -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControlParams }

                # @!attribute betas
                #   This endpoint is in beta: requests must send
                #   `google-managed-data-controls-2026-09-01` in this header.
                #
                #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
                optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

                # @!method initialize(project_number:, cmek: nil, storage: nil, betas: nil, request_options: {})
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::DataControlUpdateParams}
                #   for more details.
                #
                #   @param project_number [String] The Google Cloud project's number, such as `123456789012`, not its project ID.
                #
                #   @param cmek [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams] The customer-managed encryption key control. Leave it out to keep the control as
                #
                #   @param storage [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams] The customer-owned storage control. Leave it out to keep the control as it is. S
                #
                #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
                #
                #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
              end
            end
          end
        end
      end
    end
  end
end
