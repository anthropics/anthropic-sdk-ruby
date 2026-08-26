# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalKeys#create
        class BetaExternalKey < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Identifier of the external key config. A tagged ID prefixed `ekey_`, or — for
          #   organizations on the Claude Platform on AWS — the AWS KMS key ARN.
          #
          #   @return [String]
          required :id, String

          # @!attribute attachment
          #   Whether any workspace uses this config to encrypt its data — counting live and
          #   archived workspaces (an archived workspace's data remains encrypted under the
          #   config), excluding deleted ones. Only an attached config is used by the
          #   encryption path; an `unattached` config is inert and can be deleted.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaExternalKeyAttachedAttachment, Anthropic::Models::Beta::Organization::BetaExternalKeyUnattachedAttachment]
          required :attachment, union: -> { Anthropic::Beta::Organization::BetaExternalKey::Attachment }

          # @!attribute created_at
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute display_name
          #   Human-friendly display name. Null if none was set.
          #
          #   @return [String, nil]
          required :display_name, String, nil?: true

          # @!attribute geo
          #   Data residency geo. Selects which regional validator handles this key's
          #   encrypt/decrypt roundtrips.
          #
          #   @return [String]
          required :geo, String

          # @!attribute provider_config
          #   KMS provider identity and auth coordinates.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfig]
          required :provider_config, union: -> { Anthropic::Beta::Organization::BetaExternalKey::ProviderConfig }

          # @!attribute type
          #
          #   @return [Symbol, :external_key]
          required :type, const: :external_key

          # @!attribute updated_at
          #
          #   @return [Time]
          required :updated_at, Time

          # @!method initialize(id:, attachment:, created_at:, display_name:, geo:, provider_config:, updated_at:, type: :external_key)
          #   CMEK external key config belonging to the caller's organization.
          #
          #   Configs are organization-scoped. Workspaces attach to a config; once any
          #   workspace references it, the provider fields become effectively immutable
          #   (existing encrypted data needs the config for decrypt).
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaExternalKey} for more details.
          #
          #   @param id [String] Identifier of the external key config. A tagged ID prefixed `ekey_`, or — for or
          #
          #   @param attachment [Anthropic::Models::Beta::Organization::BetaExternalKeyAttachedAttachment, Anthropic::Models::Beta::Organization::BetaExternalKeyUnattachedAttachment] Whether any workspace uses this config to encrypt its data — counting live and a
          #
          #   @param created_at [Time]
          #
          #   @param display_name [String, nil] Human-friendly display name. Null if none was set.
          #
          #   @param geo [String] Data residency geo. Selects which regional validator handles this key's encrypt/
          #
          #   @param provider_config [Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfig] KMS provider identity and auth coordinates.
          #
          #   @param updated_at [Time]
          #
          #   @param type [Symbol, :external_key]

          # Whether any workspace uses this config to encrypt its data — counting live and
          # archived workspaces (an archived workspace's data remains encrypted under the
          # config), excluding deleted ones. Only an attached config is used by the
          # encryption path; an `unattached` config is inert and can be deleted.
          #
          # @see Anthropic::Models::Beta::Organization::BetaExternalKey#attachment
          module Attachment
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :attached, -> { Anthropic::Beta::Organization::BetaExternalKeyAttachedAttachment }

            variant :unattached, -> { Anthropic::Beta::Organization::BetaExternalKeyUnattachedAttachment }

            module Type
              extend Anthropic::Internal::Type::Enum

              ATTACHED = :attached
              UNATTACHED = :unattached

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaExternalKeyAttachedAttachment, Anthropic::Models::Beta::Organization::BetaExternalKeyUnattachedAttachment)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaExternalKeyAttachedAttachment, Anthropic::Models::Beta::Organization::BetaExternalKeyUnattachedAttachment]
            def self.new(type:, **args)
              case type.to_sym
              when :attached
                Anthropic::Beta::Organization::BetaExternalKeyAttachedAttachment.new(**args)
              when :unattached
                Anthropic::Beta::Organization::BetaExternalKeyUnattachedAttachment.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

          # KMS provider identity and auth coordinates.
          #
          # @see Anthropic::Models::Beta::Organization::BetaExternalKey#provider_config
          module ProviderConfig
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :aws, -> { Anthropic::Beta::Organization::BetaAWSExternalKeyConfig }

            variant :gcp, -> { Anthropic::Beta::Organization::BetaGCPExternalKeyConfig }

            variant :azure, -> { Anthropic::Beta::Organization::BetaAzureExternalKeyConfig }

            module Type
              extend Anthropic::Internal::Type::Enum

              AWS = :aws
              GCP = :gcp
              AZURE = :azure

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfig)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::BetaExternalKey::ProviderConfig} for
            # more details.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :kms_arn Full ARN of the AWS KMS key.
            #
            #   @option args [String, nil] :region AWS region. Derived from `kms_arn` if omitted.
            #
            #   @option args [String, nil] :role_arn IAM role ARN. Deprecated — Anthropic reaches the KMS key via a managed intermedi
            #
            #   @option args [String] :key_name Full resource name of the Cloud KMS key.
            #
            #   @option args [String] :tenant_id Azure AD tenant ID.
            #
            #   @option args [String] :vault_uri Key Vault data-plane URI — `https://{vault-name}.vault.azure.net` or `https://{h
            #
            #   @option args [String, nil] :client_id Azure AD application (client) ID. Omit to use Anthropic's multitenant app. Provi
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfig]
            def self.new(type:, **args)
              case type.to_sym
              when :aws
                Anthropic::Beta::Organization::BetaAWSExternalKeyConfig.new(**args)
              when :gcp
                Anthropic::Beta::Organization::BetaGCPExternalKeyConfig.new(**args)
              when :azure
                Anthropic::Beta::Organization::BetaAzureExternalKeyConfig.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end
        end
      end
    end
  end
end
