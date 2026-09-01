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
          # the value is the AWS KMS key ARN, and the key must be a single-Region key in the
          # same AWS account and Region as the Workspace. On that platform the key is
          # validated against this Workspace when it is attached, so a key-policy problem is
          # reported as an error on this request. This field is write-once: once a key is
          # attached to a Workspace it cannot be detached or replaced. To rotate key
          # material, rotate the underlying key on your cloud KMS; the `external_key_id`
          # stays the same.
          sig { returns(T.nilable(String)) }
          attr_reader :external_key_id

          sig { params(external_key_id: String).void }
          attr_writer :external_key_id

          # Name of the Workspace.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # User-defined tags as string key-value pairs. Keys may not begin with
          # `anthropic`.
          sig { returns(T.nilable(T::Hash[Symbol, T.nilable(String)])) }
          attr_accessor :tags

          sig do
            params(
              workspace_id: String,
              data_residency:
                T.nilable(
                  Anthropic::Beta::Organization::BetaDataResidencyUpdateConfig::OrHash
                ),
              display_color: String,
              external_key_id: String,
              name: String,
              tags: T.nilable(T::Hash[Symbol, T.nilable(String)]),
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
            # the value is the AWS KMS key ARN, and the key must be a single-Region key in the
            # same AWS account and Region as the Workspace. On that platform the key is
            # validated against this Workspace when it is attached, so a key-policy problem is
            # reported as an error on this request. This field is write-once: once a key is
            # attached to a Workspace it cannot be detached or replaced. To rotate key
            # material, rotate the underlying key on your cloud KMS; the `external_key_id`
            # stays the same.
            external_key_id: nil,
            # Name of the Workspace.
            name: nil,
            # User-defined tags as string key-value pairs. Keys may not begin with
            # `anthropic`.
            tags: nil,
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
                name: String,
                tags: T.nilable(T::Hash[Symbol, T.nilable(String)]),
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
