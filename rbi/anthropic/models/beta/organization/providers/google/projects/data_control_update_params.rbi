# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class DataControlUpdateParams < Anthropic::Internal::Type::BaseModel
                extend Anthropic::Internal::Type::RequestParameters::Converter
                include Anthropic::Internal::Type::RequestParameters

                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::DataControlUpdateParams,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The Google Cloud project's number, such as `123456789012`, not its project ID.
                sig { returns(String) }
                attr_accessor :project_number

                # The customer-managed encryption key control. Leave it out to keep the control as
                # it is. Send `cmek`, `storage`, or both.
                sig do
                  returns(
                    T.nilable(
                      T.any(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams
                      )
                    )
                  )
                end
                attr_reader :cmek

                sig do
                  params(
                    cmek:
                      T.any(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams::OrHash,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams::OrHash
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
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams
                      )
                    )
                  )
                end
                attr_reader :storage

                sig do
                  params(
                    storage:
                      T.any(
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams::OrHash,
                        Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams::OrHash
                      )
                  ).void
                end
                attr_writer :storage

                # This endpoint is in beta: requests must send
                # `google-managed-data-controls-2026-09-01` in this header.
                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                      ]
                    )
                  )
                end
                attr_reader :betas

                sig do
                  params(
                    betas:
                      T::Array[
                        T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                      ]
                  ).void
                end
                attr_writer :betas

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
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The Google Cloud project's number, such as `123456789012`, not its project ID.
                  project_number:,
                  # The customer-managed encryption key control. Leave it out to keep the control as
                  # it is. Send `cmek`, `storage`, or both.
                  cmek: nil,
                  # The customer-owned storage control. Leave it out to keep the control as it is.
                  # Send `cmek`, `storage`, or both.
                  storage: nil,
                  # This endpoint is in beta: requests must send
                  # `google-managed-data-controls-2026-09-01` in this header.
                  betas: nil,
                  request_options: {}
                )
                end

                sig do
                  override.returns(
                    {
                      project_number: String,
                      cmek:
                        T.any(
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams
                        ),
                      storage:
                        T.any(
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams,
                          Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams
                        ),
                      betas:
                        T::Array[
                          T.any(Anthropic::AnthropicBeta::OrSymbol, String)
                        ],
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
end
