# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalKeys#create
        class ExternalKeyCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute provider_config
          #   KMS provider identity and auth coordinates.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfigParam]
          required :provider_config,
                   union: -> { Anthropic::Beta::Organization::ExternalKeyCreateParams::ProviderConfig }

          # @!attribute display_name
          #   Human-friendly display name.
          #
          #   @return [String, nil]
          optional :display_name, String, nil?: true

          # @!attribute geo
          #   Data residency geo. Only `us` is supported.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::ExternalKeyCreateParams::Geo, nil]
          optional :geo, enum: -> { Anthropic::Beta::Organization::ExternalKeyCreateParams::Geo }

          # @!attribute user_profile_id
          #   ID of a user profile to bind the key to. A user profile represents one of your
          #   customers: bind a customer's key to that customer's user profile. A key bound to
          #   a user profile can only be attached to a Workspace that has the same user
          #   profile, and the binding cannot be changed later. Omit this field only for your
          #   organization's own key, because a key created without a user profile ID can be
          #   attached to any Workspace, including another customer's.
          #
          #   @return [String, nil]
          optional :user_profile_id, String, nil?: true

          # @!method initialize(provider_config:, display_name: nil, geo: nil, user_profile_id: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::ExternalKeyCreateParams} for more
          #   details.
          #
          #   @param provider_config [Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfigParam] KMS provider identity and auth coordinates.
          #
          #   @param display_name [String, nil] Human-friendly display name.
          #
          #   @param geo [Symbol, Anthropic::Models::Beta::Organization::ExternalKeyCreateParams::Geo] Data residency geo. Only `us` is supported.
          #
          #   @param user_profile_id [String, nil] ID of a user profile to bind the key to. A user profile represents one of your c
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # KMS provider identity and auth coordinates.
          module ProviderConfig
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :aws, -> { Anthropic::Beta::Organization::BetaAWSExternalKeyConfig }

            variant :gcp, -> { Anthropic::Beta::Organization::BetaGCPExternalKeyConfig }

            # Azure Key Vault provider configuration.
            variant :azure, -> { Anthropic::Beta::Organization::BetaAzureExternalKeyConfigParam }

            module Type
              extend Anthropic::Internal::Type::Enum

              AWS = :aws
              GCP = :gcp
              AZURE = :azure

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfigParam)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::ExternalKeyCreateParams::ProviderConfig}
            # for more details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::ExternalKeyCreateParams::ProviderConfig::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :kms_arn Full ARN of the AWS KMS key. On Claude Platform on AWS, alias ARNs are rejected,
            #
            #   @option args [String, nil] :region AWS region. Derived from `kms_arn` if omitted.
            #
            #   @option args [String, nil] :role_arn IAM role ARN. Deprecated; this field is ignored.
            #
            #   @option args [String] :key_name Full resource name of the Cloud KMS key.
            #
            #   @option args [String] :tenant_id Azure AD tenant ID.
            #
            #   @option args [String] :vault_uri Key Vault data-plane URI — `https://{vault-name}.vault.azure.net` or
            #
            #   @option args [String, nil] :client_id Azure AD application (client) ID. Omit to use Anthropic's multitenant app. Provi
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaAWSExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaGCPExternalKeyConfig, Anthropic::Models::Beta::Organization::BetaAzureExternalKeyConfigParam]
            def self.new(type:, **args)
              case type.to_sym
              when :aws
                Anthropic::Beta::Organization::BetaAWSExternalKeyConfig.new(**args)
              when :gcp
                Anthropic::Beta::Organization::BetaGCPExternalKeyConfig.new(**args)
              when :azure
                Anthropic::Beta::Organization::BetaAzureExternalKeyConfigParam.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

          # Data residency geo. Only `us` is supported.
          module Geo
            extend Anthropic::Internal::Type::Enum

            US = :us

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
