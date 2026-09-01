# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalKey < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaExternalKey,
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
            returns(
              Anthropic::Beta::Organization::BetaExternalKey::Attachment::Variants
            )
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
              Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig::Variants
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
                  Anthropic::Beta::Organization::BetaExternalKeyAttachedAttachment::OrHash,
                  Anthropic::Beta::Organization::BetaExternalKeyUnattachedAttachment::OrHash
                ),
              created_at: Time,
              display_name: T.nilable(String),
              geo: String,
              provider_config:
                T.any(
                  Anthropic::Beta::Organization::BetaAWSExternalKeyConfig::OrHash,
                  Anthropic::Beta::Organization::BetaGCPExternalKeyConfig::OrHash,
                  Anthropic::Beta::Organization::BetaAzureExternalKeyConfig::OrHash
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
                  Anthropic::Beta::Organization::BetaExternalKey::Attachment::Variants,
                created_at: Time,
                display_name: T.nilable(String),
                geo: String,
                provider_config:
                  Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig::Variants,
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
                  Anthropic::Beta::Organization::BetaExternalKeyAttachedAttachment,
                  Anthropic::Beta::Organization::BetaExternalKeyUnattachedAttachment
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaExternalKey::Attachment::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ATTACHED =
                T.let(
                  :attached,
                  Anthropic::Beta::Organization::BetaExternalKey::Attachment::Type::TaggedSymbol
                )
              UNATTACHED =
                T.let(
                  :unattached,
                  Anthropic::Beta::Organization::BetaExternalKey::Attachment::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaExternalKey::Attachment::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaExternalKey::Attachment::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(type: T.any(Symbol, String)).returns(
                Anthropic::Beta::Organization::BetaExternalKey::Attachment::Variants
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
                  Anthropic::Beta::Organization::BetaAWSExternalKeyConfig,
                  Anthropic::Beta::Organization::BetaGCPExternalKeyConfig,
                  Anthropic::Beta::Organization::BetaAzureExternalKeyConfig
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AWS =
                T.let(
                  :aws,
                  Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig::Type::TaggedSymbol
                )
              GCP =
                T.let(
                  :gcp,
                  Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig::Type::TaggedSymbol
                )
              AZURE =
                T.let(
                  :azure,
                  Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(
                type: T.any(Symbol, String),
                kms_arn: String,
                region: T.nilable(String),
                role_arn: T.nilable(String),
                key_name: String,
                tenant_id: String,
                vault_uri: String,
                client_id: T.nilable(String)
              ).returns(
                Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig::Variants
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
              # IAM role ARN. Deprecated — Anthropic reaches the KMS key through its own
              # intermediate role (or, on Claude Platform on AWS, with credentials AWS issues
              # for the Workspace); this field is ignored.
              role_arn: nil,
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
end
