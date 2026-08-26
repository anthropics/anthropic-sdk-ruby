# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class WorkspaceCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::WorkspaceCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Name of the Workspace.
          sig { returns(String) }
          attr_accessor :name

          # Data residency configuration for the workspace. If omitted, defaults to
          # `workspace_geo: "us"`, `allowed_inference_geos: "unrestricted"`, and
          # `default_inference_geo: "global"`.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaDataResidencyCreateConfig
              )
            )
          end
          attr_reader :data_residency

          sig do
            params(
              data_residency:
                T.nilable(
                  Anthropic::Beta::Organization::BetaDataResidencyCreateConfig::OrHash
                )
            ).void
          end
          attr_writer :data_residency

          # Hex color code representing the Workspace in the Anthropic Console.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_color

          # ID of the customer-managed encryption key (CMEK) configuration to use for this
          # Workspace. Setting this field requires CMEK to be enabled for your organization.
          # When set, data stored for this Workspace is encrypted with the referenced key.
          # Create key configurations with the External Keys API. This field is write-once:
          # once a key is attached to a Workspace it cannot be detached or replaced. To
          # rotate key material, rotate the underlying key on your cloud KMS; the
          # `external_key_id` stays the same.
          sig { returns(T.nilable(String)) }
          attr_accessor :external_key_id

          # User-defined tags as string key-value pairs. Keys may not begin with
          # `anthropic`.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_accessor :tags

          # Optional header to specify the beta version(s) you want to use.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              name: String,
              data_residency:
                T.nilable(
                  Anthropic::Beta::Organization::BetaDataResidencyCreateConfig::OrHash
                ),
              display_color: T.nilable(String),
              external_key_id: T.nilable(String),
              tags: T.nilable(T::Hash[Symbol, String]),
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Name of the Workspace.
            name:,
            # Data residency configuration for the workspace. If omitted, defaults to
            # `workspace_geo: "us"`, `allowed_inference_geos: "unrestricted"`, and
            # `default_inference_geo: "global"`.
            data_residency: nil,
            # Hex color code representing the Workspace in the Anthropic Console.
            display_color: nil,
            # ID of the customer-managed encryption key (CMEK) configuration to use for this
            # Workspace. Setting this field requires CMEK to be enabled for your organization.
            # When set, data stored for this Workspace is encrypted with the referenced key.
            # Create key configurations with the External Keys API. This field is write-once:
            # once a key is attached to a Workspace it cannot be detached or replaced. To
            # rotate key material, rotate the underlying key on your cloud KMS; the
            # `external_key_id` stays the same.
            external_key_id: nil,
            # User-defined tags as string key-value pairs. Keys may not begin with
            # `anthropic`.
            tags: nil,
            # Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                name: String,
                data_residency:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaDataResidencyCreateConfig
                  ),
                display_color: T.nilable(String),
                external_key_id: T.nilable(String),
                tags: T.nilable(T::Hash[Symbol, String]),
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
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
