# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class WorkspaceUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::WorkspaceUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :workspace_id

          # Data residency configuration for the workspace.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig
              )
            )
          end
          attr_reader :data_residency

          sig do
            params(
              data_residency:
                T.nilable(
                  Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::OrHash
                )
            ).void
          end
          attr_writer :data_residency

          # Hex color code representing the Workspace in the Anthropic Console.
          sig { returns(T.nilable(String)) }
          attr_reader :display_color

          sig { params(display_color: String).void }
          attr_writer :display_color

          # ID of the customer-managed encryption key (CMEK) configuration to use for this
          # Workspace. Setting this field requires CMEK to be enabled for your organization.
          # When set, data stored for this Workspace is encrypted with the referenced key.
          # Create key configurations with the External Keys API. On Claude Platform on AWS
          # the value for an AWS KMS key is the key's ARN, and your organization's own key
          # must be a single-Region key in the same Region as the Workspace. If that key is
          # outside the Workspace's AWS account, it can be attached only by updating an
          # active Workspace. On that platform the key is validated against this Workspace
          # when it is attached, so a key-policy problem is reported as an error on this
          # request. This field is write-once: once a key is attached to a Workspace it
          # cannot be detached or replaced. To rotate key material, rotate the underlying
          # key on your cloud KMS; the `external_key_id` stays the same.
          sig { returns(T.nilable(String)) }
          attr_reader :external_key_id

          sig { params(external_key_id: String).void }
          attr_writer :external_key_id

          # Changes to where the Workspace's retained inference data and transcript copies
          # go, and to whether Anthropic's human review applies. Requires the
          # `efs-2026-10-01` `anthropic-beta` value. An omitted member is unchanged. Cannot
          # be null. An Admin API key can't set this field, because it doesn't belong to a
          # user or a service account. Use an API key that belongs to one, or an OAuth
          # token.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaInferenceDataPrivacyUpdateParam
              )
            )
          end
          attr_reader :inference_data_privacy

          sig do
            params(
              inference_data_privacy:
                T.nilable(
                  Anthropic::Beta::Organization::BetaInferenceDataPrivacyUpdateParam::OrHash
                )
            ).void
          end
          attr_writer :inference_data_privacy

          # Name of the Workspace.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # User-defined tags as string key-value pairs. Keys may not begin with
          # `anthropic`.
          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
          attr_accessor :tags

          # ID of a user profile to attach to the Workspace. Every inference request through
          # the Workspace must then name this user profile; the API rejects a request that
          # names none or a different one. Once set, it can't be replaced or removed
          # (sending the same ID again changes nothing); only deleting the user profile
          # clears it. It can't be set on a Workspace whose External Key isn't bound to this
          # user profile. The default Workspace can't have a user profile.
          sig { returns(T.nilable(String)) }
          attr_reader :user_profile_id

          sig { params(user_profile_id: String).void }
          attr_writer :user_profile_id

          # Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta
          # features: additional parameters, accepted values and response fields.
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
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              workspace_id: String,
              data_residency:
                T.nilable(
                  Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::OrHash
                ),
              display_color: String,
              external_key_id: String,
              inference_data_privacy:
                T.nilable(
                  Anthropic::Beta::Organization::BetaInferenceDataPrivacyUpdateParam::OrHash
                ),
              name: String,
              tags: T.nilable(T::Hash[Symbol, T.nilable(String)]),
              user_profile_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            workspace_id:,
            # Data residency configuration for the workspace.
            data_residency: nil,
            # Hex color code representing the Workspace in the Anthropic Console.
            display_color: nil,
            # ID of the customer-managed encryption key (CMEK) configuration to use for this
            # Workspace. Setting this field requires CMEK to be enabled for your organization.
            # When set, data stored for this Workspace is encrypted with the referenced key.
            # Create key configurations with the External Keys API. On Claude Platform on AWS
            # the value for an AWS KMS key is the key's ARN, and your organization's own key
            # must be a single-Region key in the same Region as the Workspace. If that key is
            # outside the Workspace's AWS account, it can be attached only by updating an
            # active Workspace. On that platform the key is validated against this Workspace
            # when it is attached, so a key-policy problem is reported as an error on this
            # request. This field is write-once: once a key is attached to a Workspace it
            # cannot be detached or replaced. To rotate key material, rotate the underlying
            # key on your cloud KMS; the `external_key_id` stays the same.
            external_key_id: nil,
            # Changes to where the Workspace's retained inference data and transcript copies
            # go, and to whether Anthropic's human review applies. Requires the
            # `efs-2026-10-01` `anthropic-beta` value. An omitted member is unchanged. Cannot
            # be null. An Admin API key can't set this field, because it doesn't belong to a
            # user or a service account. Use an API key that belongs to one, or an OAuth
            # token.
            inference_data_privacy: nil,
            # Name of the Workspace.
            name: nil,
            # User-defined tags as string key-value pairs. Keys may not begin with
            # `anthropic`.
            tags: nil,
            # ID of a user profile to attach to the Workspace. Every inference request through
            # the Workspace must then name this user profile; the API rejects a request that
            # names none or a different one. Once set, it can't be replaced or removed
            # (sending the same ID again changes nothing); only deleting the user profile
            # clears it. It can't be set on a Workspace whose External Key isn't bound to this
            # user profile. The default Workspace can't have a user profile.
            user_profile_id: nil,
            # Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta
            # features: additional parameters, accepted values and response fields.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                workspace_id: String,
                data_residency:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig
                  ),
                display_color: String,
                external_key_id: String,
                inference_data_privacy:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaInferenceDataPrivacyUpdateParam
                  ),
                name: String,
                tags: T.nilable(T::Hash[Symbol, T.nilable(String)]),
                user_profile_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
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
