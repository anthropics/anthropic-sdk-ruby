# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::ExternalKeys#update
      class ExternalKeyUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute external_key_id
        #   ID of the External Key.
        #
        #   @return [String]
        required :external_key_id, String

        # @!attribute display_name
        #   Human-friendly display name.
        #
        #   @return [String, nil]
        optional :display_name, String, nil?: true

        # @!attribute geo
        #   Data residency geo. Only `us` is supported.
        #
        #   @return [Symbol, Anthropic::Models::Organization::ExternalKeyUpdateParams::Geo, nil]
        optional :geo, enum: -> { Anthropic::Organization::ExternalKeyUpdateParams::Geo }, nil?: true

        # @!attribute provider_config
        #   KMS provider identity and auth coordinates.
        #
        #   @return [Anthropic::Models::Organization::AWSExternalKeyConfig, Anthropic::Models::Organization::GCPExternalKeyConfig, Anthropic::Models::Organization::AzureExternalKeyConfigParam, nil]
        optional :provider_config,
                 union: -> { Anthropic::Organization::ExternalKeyUpdateParams::ProviderConfig },
                 nil?: true

        # @!method initialize(external_key_id:, display_name: nil, geo: nil, provider_config: nil, request_options: {})
        #   @param external_key_id [String] ID of the External Key.
        #
        #   @param display_name [String, nil] Human-friendly display name.
        #
        #   @param geo [Symbol, Anthropic::Models::Organization::ExternalKeyUpdateParams::Geo, nil] Data residency geo. Only `us` is supported.
        #
        #   @param provider_config [Anthropic::Models::Organization::AWSExternalKeyConfig, Anthropic::Models::Organization::GCPExternalKeyConfig, Anthropic::Models::Organization::AzureExternalKeyConfigParam, nil] KMS provider identity and auth coordinates.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Data residency geo. Only `us` is supported.
        module Geo
          extend Anthropic::Internal::Type::Enum

          US = :us

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # KMS provider identity and auth coordinates.
        module ProviderConfig
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :aws, -> { Anthropic::Organization::AWSExternalKeyConfig }

          variant :gcp, -> { Anthropic::Organization::GCPExternalKeyConfig }

          # Azure Key Vault provider configuration.
          variant :azure, -> { Anthropic::Organization::AzureExternalKeyConfigParam }

          module Type
            extend Anthropic::Internal::Type::Enum

            AWS = :aws
            GCP = :gcp
            AZURE = :azure

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Organization::AWSExternalKeyConfig, Anthropic::Models::Organization::GCPExternalKeyConfig, Anthropic::Models::Organization::AzureExternalKeyConfigParam)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Organization::ExternalKeyUpdateParams::ProviderConfig} for
          # more details.
          #
          # @param type [Symbol, Anthropic::Models::Organization::ExternalKeyUpdateParams::ProviderConfig::Type, String]
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
          # @return [Anthropic::Models::Organization::AWSExternalKeyConfig, Anthropic::Models::Organization::GCPExternalKeyConfig, Anthropic::Models::Organization::AzureExternalKeyConfigParam]
          def self.new(type:, **args)
            case type.to_sym
            when :aws
              Anthropic::Organization::AWSExternalKeyConfig.new(**args)
            when :gcp
              Anthropic::Organization::GCPExternalKeyConfig.new(**args)
            when :azure
              Anthropic::Organization::AzureExternalKeyConfigParam.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
