# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaWorkspace < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaWorkspace,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the Workspace.
          sig { returns(String) }
          attr_accessor :id

          # RFC 3339 datetime string indicating when the Workspace was archived, or `null`
          # if the Workspace is not archived.
          sig { returns(T.nilable(Time)) }
          attr_accessor :archived_at

          # Identifier for this Workspace's encryption compartment. When you configure a
          # customer-managed encryption key (CMEK) on AWS, reference this value in your KMS
          # key-policy condition so the key is scoped to this compartment. On GCP and Azure,
          # Anthropic enforces the compartment binding automatically; you do not need to
          # reference this value in your key configuration. See the CMEK integration guide
          # for the required key configuration, including the value used during key
          # validation.
          sig { returns(String) }
          attr_accessor :compartment_id

          # RFC 3339 datetime string indicating when the Workspace was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # Data residency configuration.
          sig { returns(Anthropic::Beta::Organization::BetaDataResidency) }
          attr_reader :data_residency

          sig do
            params(
              data_residency:
                Anthropic::Beta::Organization::BetaDataResidency::OrHash
            ).void
          end
          attr_writer :data_residency

          # Hex color code representing the Workspace in the Anthropic Console.
          sig { returns(String) }
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

          # Name of the Workspace.
          sig { returns(String) }
          attr_accessor :name

          # User-defined tags as string key-value pairs. Keys may not begin with
          # `anthropic`.
          sig { returns(T::Hash[Symbol, String]) }
          attr_accessor :tags

          # Object type.
          #
          # For Workspaces, this is always `"workspace"`.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(
              id: String,
              archived_at: T.nilable(Time),
              compartment_id: String,
              created_at: Time,
              data_residency:
                Anthropic::Beta::Organization::BetaDataResidency::OrHash,
              display_color: String,
              external_key_id: T.nilable(String),
              name: String,
              tags: T::Hash[Symbol, String],
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the Workspace.
            id:,
            # RFC 3339 datetime string indicating when the Workspace was archived, or `null`
            # if the Workspace is not archived.
            archived_at:,
            # Identifier for this Workspace's encryption compartment. When you configure a
            # customer-managed encryption key (CMEK) on AWS, reference this value in your KMS
            # key-policy condition so the key is scoped to this compartment. On GCP and Azure,
            # Anthropic enforces the compartment binding automatically; you do not need to
            # reference this value in your key configuration. See the CMEK integration guide
            # for the required key configuration, including the value used during key
            # validation.
            compartment_id:,
            # RFC 3339 datetime string indicating when the Workspace was created.
            created_at:,
            # Data residency configuration.
            data_residency:,
            # Hex color code representing the Workspace in the Anthropic Console.
            display_color:,
            # ID of the customer-managed encryption key (CMEK) configuration to use for this
            # Workspace. Setting this field requires CMEK to be enabled for your organization.
            # When set, data stored for this Workspace is encrypted with the referenced key.
            # Create key configurations with the External Keys API. This field is write-once:
            # once a key is attached to a Workspace it cannot be detached or replaced. To
            # rotate key material, rotate the underlying key on your cloud KMS; the
            # `external_key_id` stays the same.
            external_key_id:,
            # Name of the Workspace.
            name:,
            # User-defined tags as string key-value pairs. Keys may not begin with
            # `anthropic`.
            tags:,
            # Object type.
            #
            # For Workspaces, this is always `"workspace"`.
            type: :workspace
          )
          end

          sig do
            override.returns(
              {
                id: String,
                archived_at: T.nilable(Time),
                compartment_id: String,
                created_at: Time,
                data_residency:
                  Anthropic::Beta::Organization::BetaDataResidency,
                display_color: String,
                external_key_id: T.nilable(String),
                name: String,
                tags: T::Hash[Symbol, String],
                type: Symbol
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
