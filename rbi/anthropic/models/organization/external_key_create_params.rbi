# typed: strong

module Anthropic
  module Models
    module Organization
      class ExternalKeyCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::ExternalKeyCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # KMS provider identity and auth coordinates.
        sig do
          returns(
            T.any(
              Anthropic::Organization::AWSExternalKeyConfig,
              Anthropic::Organization::GCPExternalKeyConfig,
              Anthropic::Organization::AzureExternalKeyConfigParam
            )
          )
        end
        attr_accessor :provider_config

        # Human-friendly display name.
        sig { returns(T.nilable(String)) }
        attr_accessor :display_name

        # Data residency geo. Only `us` is supported.
        sig do
          returns(
            T.nilable(
              Anthropic::Organization::ExternalKeyCreateParams::Geo::OrSymbol
            )
          )
        end
        attr_reader :geo

        sig do
          params(
            geo: Anthropic::Organization::ExternalKeyCreateParams::Geo::OrSymbol
          ).void
        end
        attr_writer :geo

        sig do
          params(
            provider_config:
              T.any(
                Anthropic::Organization::AWSExternalKeyConfig::OrHash,
                Anthropic::Organization::GCPExternalKeyConfig::OrHash,
                Anthropic::Organization::AzureExternalKeyConfigParam::OrHash
              ),
            display_name: T.nilable(String),
            geo:
              Anthropic::Organization::ExternalKeyCreateParams::Geo::OrSymbol,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # KMS provider identity and auth coordinates.
          provider_config:,
          # Human-friendly display name.
          display_name: nil,
          # Data residency geo. Only `us` is supported.
          geo: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              provider_config:
                T.any(
                  Anthropic::Organization::AWSExternalKeyConfig,
                  Anthropic::Organization::GCPExternalKeyConfig,
                  Anthropic::Organization::AzureExternalKeyConfigParam
                ),
              display_name: T.nilable(String),
              geo:
                Anthropic::Organization::ExternalKeyCreateParams::Geo::OrSymbol,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # KMS provider identity and auth coordinates.
        module ProviderConfig
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Organization::AWSExternalKeyConfig,
                Anthropic::Organization::GCPExternalKeyConfig,
                Anthropic::Organization::AzureExternalKeyConfigParam
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Organization::ExternalKeyCreateParams::ProviderConfig::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AWS =
              T.let(
                :aws,
                Anthropic::Organization::ExternalKeyCreateParams::ProviderConfig::Type::TaggedSymbol
              )
            GCP =
              T.let(
                :gcp,
                Anthropic::Organization::ExternalKeyCreateParams::ProviderConfig::Type::TaggedSymbol
              )
            AZURE =
              T.let(
                :azure,
                Anthropic::Organization::ExternalKeyCreateParams::ProviderConfig::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::ExternalKeyCreateParams::ProviderConfig::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::ExternalKeyCreateParams::ProviderConfig::Variants
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
                Anthropic::Organization::ExternalKeyCreateParams::ProviderConfig::Type::OrSymbol,
              kms_arn: String,
              region: T.nilable(String),
              key_name: String,
              tenant_id: String,
              vault_uri: String,
              client_id: T.nilable(String)
            ).returns(
              Anthropic::Organization::ExternalKeyCreateParams::ProviderConfig::Variants
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

        # Data residency geo. Only `us` is supported.
        module Geo
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Organization::ExternalKeyCreateParams::Geo
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          US =
            T.let(
              :us,
              Anthropic::Organization::ExternalKeyCreateParams::Geo::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::ExternalKeyCreateParams::Geo::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
