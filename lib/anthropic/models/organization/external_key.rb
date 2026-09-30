# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::ExternalKeys#create
      class ExternalKey < Anthropic::Internal::Type::BaseModel
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
        #   @return [Anthropic::Models::Organization::ExternalKeyAttachedAttachment, Anthropic::Models::Organization::ExternalKeyUnattachedAttachment]
        required :attachment, union: -> { Anthropic::Organization::ExternalKey::Attachment }

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
        #   @return [Anthropic::Models::Organization::AWSExternalKeyConfig, Anthropic::Models::Organization::GCPExternalKeyConfig, Anthropic::Models::Organization::AzureExternalKeyConfig]
        required :provider_config, union: -> { Anthropic::Organization::ExternalKey::ProviderConfig }

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
        #   {Anthropic::Models::Organization::ExternalKey} for more details.
        #
        #   @param id [String] Identifier of the external key config. A tagged ID prefixed `ekey_`, or — for or
        #
        #   @param attachment [Anthropic::Models::Organization::ExternalKeyAttachedAttachment, Anthropic::Models::Organization::ExternalKeyUnattachedAttachment] Whether any workspace uses this config to encrypt its data — counting live and a
        #
        #   @param created_at [Time]
        #
        #   @param display_name [String, nil] Human-friendly display name. Null if none was set.
        #
        #   @param geo [String] Data residency geo. Selects which regional validator handles this key's encrypt/
        #
        #   @param provider_config [Anthropic::Models::Organization::AWSExternalKeyConfig, Anthropic::Models::Organization::GCPExternalKeyConfig, Anthropic::Models::Organization::AzureExternalKeyConfig] KMS provider identity and auth coordinates.
        #
        #   @param updated_at [Time]
        #
        #   @param type [Symbol, :external_key]

        # Whether any workspace uses this config to encrypt its data — counting live and
        # archived workspaces (an archived workspace's data remains encrypted under the
        # config), excluding deleted ones. Only an attached config is used by the
        # encryption path; an `unattached` config is inert and can be deleted.
        #
        # @see Anthropic::Models::Organization::ExternalKey#attachment
        module Attachment
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :attached, -> { Anthropic::Organization::ExternalKeyAttachedAttachment }

          variant :unattached, -> { Anthropic::Organization::ExternalKeyUnattachedAttachment }

          module Type
            extend Anthropic::Internal::Type::Enum

            ATTACHED = :attached
            UNATTACHED = :unattached

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Organization::ExternalKeyAttachedAttachment, Anthropic::Models::Organization::ExternalKeyUnattachedAttachment)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Organization::ExternalKey::Attachment::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Organization::ExternalKeyAttachedAttachment, Anthropic::Models::Organization::ExternalKeyUnattachedAttachment]
          def self.new(type:, **args)
            case type.to_sym
            when :attached
              Anthropic::Organization::ExternalKeyAttachedAttachment.new(**args)
            when :unattached
              Anthropic::Organization::ExternalKeyUnattachedAttachment.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # KMS provider identity and auth coordinates.
        #
        # @see Anthropic::Models::Organization::ExternalKey#provider_config
        module ProviderConfig
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :aws, -> { Anthropic::Organization::AWSExternalKeyConfig }

          variant :gcp, -> { Anthropic::Organization::GCPExternalKeyConfig }

          variant :azure, -> { Anthropic::Organization::AzureExternalKeyConfig }

          module Type
            extend Anthropic::Internal::Type::Enum

            AWS = :aws
            GCP = :gcp
            AZURE = :azure

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Organization::AWSExternalKeyConfig, Anthropic::Models::Organization::GCPExternalKeyConfig, Anthropic::Models::Organization::AzureExternalKeyConfig)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Organization::ExternalKey::ProviderConfig} for more details.
          #
          # @param type [Symbol, Anthropic::Models::Organization::ExternalKey::ProviderConfig::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :kms_arn Full ARN of the AWS KMS key. On Claude Platform on AWS the key must be a single-
          #
          #   @option args [String, nil] :region AWS region. Derived from `kms_arn` if omitted.
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
          # @return [Anthropic::Models::Organization::AWSExternalKeyConfig, Anthropic::Models::Organization::GCPExternalKeyConfig, Anthropic::Models::Organization::AzureExternalKeyConfig]
          def self.new(type:, **args)
            case type.to_sym
            when :aws
              Anthropic::Organization::AWSExternalKeyConfig.new(**args)
            when :gcp
              Anthropic::Organization::GCPExternalKeyConfig.new(**args)
            when :azure
              Anthropic::Organization::AzureExternalKeyConfig.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
