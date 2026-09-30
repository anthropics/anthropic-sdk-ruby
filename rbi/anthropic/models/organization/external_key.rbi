# typed: strong

module Anthropic
  module Models
    module Organization
      class ExternalKey < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::ExternalKey,
              Anthropic::Internal::AnyHash
            )
          end

        # Identifier of the external key config. A tagged ID prefixed `ekey_`, or — for
        # organizations on the Claude Platform on AWS — the AWS KMS key ARN.
        sig { returns(String) }
        attr_accessor :id

        # Whether any workspace uses this config to encrypt its data — counting live and
        # archived workspaces (an archived workspace's data remains encrypted under the
        # config), excluding deleted ones. Only an attached config is used by the
        # encryption path; an `unattached` config is inert and can be deleted.
        sig do
          returns(Anthropic::Organization::ExternalKey::Attachment::Variants)
        end
        attr_accessor :attachment

        sig { returns(Time) }
        attr_accessor :created_at

        # Human-friendly display name. Null if none was set.
        sig { returns(T.nilable(String)) }
        attr_accessor :display_name

        # Data residency geo. Selects which regional validator handles this key's
        # encrypt/decrypt roundtrips.
        sig { returns(String) }
        attr_accessor :geo

        # KMS provider identity and auth coordinates.
        sig do
          returns(
            Anthropic::Organization::ExternalKey::ProviderConfig::Variants
          )
        end
        attr_accessor :provider_config

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(Time) }
        attr_accessor :updated_at

        # CMEK external key config belonging to the caller's organization.
        #
        # Configs are organization-scoped. Workspaces attach to a config; once any
        # workspace references it, the provider fields become effectively immutable
        # (existing encrypted data needs the config for decrypt).
        sig do
          params(
            id: String,
            attachment:
              T.any(
                Anthropic::Organization::ExternalKeyAttachedAttachment::OrHash,
                Anthropic::Organization::ExternalKeyUnattachedAttachment::OrHash
              ),
            created_at: Time,
            display_name: T.nilable(String),
            geo: String,
            provider_config:
              T.any(
                Anthropic::Organization::AWSExternalKeyConfig::OrHash,
                Anthropic::Organization::GCPExternalKeyConfig::OrHash,
                Anthropic::Organization::AzureExternalKeyConfig::OrHash
              ),
            updated_at: Time,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Identifier of the external key config. A tagged ID prefixed `ekey_`, or — for
          # organizations on the Claude Platform on AWS — the AWS KMS key ARN.
          id:,
          # Whether any workspace uses this config to encrypt its data — counting live and
          # archived workspaces (an archived workspace's data remains encrypted under the
          # config), excluding deleted ones. Only an attached config is used by the
          # encryption path; an `unattached` config is inert and can be deleted.
          attachment:,
          created_at:,
          # Human-friendly display name. Null if none was set.
          display_name:,
          # Data residency geo. Selects which regional validator handles this key's
          # encrypt/decrypt roundtrips.
          geo:,
          # KMS provider identity and auth coordinates.
          provider_config:,
          updated_at:,
          type: :external_key
        )
        end

        sig do
          override.returns(
            {
              id: String,
              attachment:
                Anthropic::Organization::ExternalKey::Attachment::Variants,
              created_at: Time,
              display_name: T.nilable(String),
              geo: String,
              provider_config:
                Anthropic::Organization::ExternalKey::ProviderConfig::Variants,
              type: Symbol,
              updated_at: Time
            }
          )
        end
        def to_hash
        end

        # Whether any workspace uses this config to encrypt its data — counting live and
        # archived workspaces (an archived workspace's data remains encrypted under the
        # config), excluding deleted ones. Only an attached config is used by the
        # encryption path; an `unattached` config is inert and can be deleted.
        module Attachment
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Organization::ExternalKeyAttachedAttachment,
                Anthropic::Organization::ExternalKeyUnattachedAttachment
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Organization::ExternalKey::Attachment::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ATTACHED =
              T.let(
                :attached,
                Anthropic::Organization::ExternalKey::Attachment::Type::TaggedSymbol
              )
            UNATTACHED =
              T.let(
                :unattached,
                Anthropic::Organization::ExternalKey::Attachment::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::ExternalKey::Attachment::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::ExternalKey::Attachment::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Organization::ExternalKey::Attachment::Type::OrSymbol
            ).returns(
              Anthropic::Organization::ExternalKey::Attachment::Variants
            )
          end
          def self.new(type:)
          end
        end

        # KMS provider identity and auth coordinates.
        module ProviderConfig
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Organization::AWSExternalKeyConfig,
                Anthropic::Organization::GCPExternalKeyConfig,
                Anthropic::Organization::AzureExternalKeyConfig
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Organization::ExternalKey::ProviderConfig::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AWS =
              T.let(
                :aws,
                Anthropic::Organization::ExternalKey::ProviderConfig::Type::TaggedSymbol
              )
            GCP =
              T.let(
                :gcp,
                Anthropic::Organization::ExternalKey::ProviderConfig::Type::TaggedSymbol
              )
            AZURE =
              T.let(
                :azure,
                Anthropic::Organization::ExternalKey::ProviderConfig::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::ExternalKey::ProviderConfig::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::ExternalKey::ProviderConfig::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Organization::ExternalKey::ProviderConfig::Type::OrSymbol,
              kms_arn: String,
              region: T.nilable(String),
              key_name: String,
              tenant_id: String,
              vault_uri: String,
              client_id: T.nilable(String)
            ).returns(
              Anthropic::Organization::ExternalKey::ProviderConfig::Variants
            )
          end
          def self.new(
            type:,
            # Full ARN of the AWS KMS key. On Claude Platform on AWS the key must be a
            # single-Region key in your organization's own AWS account; cross-account keys,
            # multi-Region keys, and alias ARNs are rejected.
            kms_arn: nil,
            # AWS region. Derived from `kms_arn` if omitted.
            region: nil,
            # Full resource name of the Cloud KMS key.
            key_name: nil,
            # Azure AD tenant ID.
            tenant_id: nil,
            # Key Vault data-plane URI — `https://{vault-name}.vault.azure.net` or
            # `https://{hsm-name}.managedhsm.azure.net`.
            vault_uri: nil,
            # Azure AD application (client) ID. Omit to use Anthropic's multitenant app.
            # Provide only if using a single-tenant app registration in the customer's
            # directory.
            client_id: nil
          )
          end
        end
      end
    end
  end
end
