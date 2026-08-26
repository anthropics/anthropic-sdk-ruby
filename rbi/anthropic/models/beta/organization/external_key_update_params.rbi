# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ExternalKeyUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::ExternalKeyUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the External Key.
          sig { returns(String) }
          attr_accessor :external_key_id

          # Human-friendly display name.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_name

          # Data residency geo. Only `us` is supported.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::ExternalKeyUpdateParams::Geo::OrSymbol
              )
            )
          end
          attr_accessor :geo

          # KMS provider identity and auth coordinates.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Beta::Organization::BetaAWSExternalKeyConfig,
                  Anthropic::Beta::Organization::BetaGCPExternalKeyConfig,
                  Anthropic::Beta::Organization::BetaAzureExternalKeyConfigParam
                )
              )
            )
          end
          attr_accessor :provider_config

          sig do
            params(
              external_key_id: String,
              display_name: T.nilable(String),
              geo:
                T.nilable(
                  Anthropic::Beta::Organization::ExternalKeyUpdateParams::Geo::OrSymbol
                ),
              provider_config:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaAWSExternalKeyConfig::OrHash,
                    Anthropic::Beta::Organization::BetaGCPExternalKeyConfig::OrHash,
                    Anthropic::Beta::Organization::BetaAzureExternalKeyConfigParam::OrHash
                  )
                ),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the External Key.
            external_key_id:,
            # Human-friendly display name.
            display_name: nil,
            # Data residency geo. Only `us` is supported.
            geo: nil,
            # KMS provider identity and auth coordinates.
            provider_config: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                external_key_id: String,
                display_name: T.nilable(String),
                geo:
                  T.nilable(
                    Anthropic::Beta::Organization::ExternalKeyUpdateParams::Geo::OrSymbol
                  ),
                provider_config:
                  T.nilable(
                    T.any(
                      Anthropic::Beta::Organization::BetaAWSExternalKeyConfig,
                      Anthropic::Beta::Organization::BetaGCPExternalKeyConfig,
                      Anthropic::Beta::Organization::BetaAzureExternalKeyConfigParam
                    )
                  ),
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Data residency geo. Only `us` is supported.
          module Geo
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::ExternalKeyUpdateParams::Geo
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            US =
              T.let(
                :us,
                Anthropic::Beta::Organization::ExternalKeyUpdateParams::Geo::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::ExternalKeyUpdateParams::Geo::TaggedSymbol
                ]
              )
            end
            def self.values
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
                  Anthropic::Beta::Organization::BetaAzureExternalKeyConfigParam
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::ExternalKeyUpdateParams::ProviderConfig::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AWS =
                T.let(
                  :aws,
                  Anthropic::Beta::Organization::ExternalKeyUpdateParams::ProviderConfig::Type::TaggedSymbol
                )
              GCP =
                T.let(
                  :gcp,
                  Anthropic::Beta::Organization::ExternalKeyUpdateParams::ProviderConfig::Type::TaggedSymbol
                )
              AZURE =
                T.let(
                  :azure,
                  Anthropic::Beta::Organization::ExternalKeyUpdateParams::ProviderConfig::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::ExternalKeyUpdateParams::ProviderConfig::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::ExternalKeyUpdateParams::ProviderConfig::Variants
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
                Anthropic::Beta::Organization::ExternalKeyUpdateParams::ProviderConfig::Variants
              )
            end
            def self.new(
              type:,
              # Full ARN of the AWS KMS key.
              kms_arn: nil,
              # AWS region. Derived from `kms_arn` if omitted.
              region: nil,
              # IAM role ARN. Deprecated — Anthropic reaches the KMS key via a managed
              # intermediate role; this field is ignored.
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
