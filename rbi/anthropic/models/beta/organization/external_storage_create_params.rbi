# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ExternalStorageCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::ExternalStorageCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.any(
                Anthropic::Beta::Organization::BetaAWSExternalStorageConfigParam,
                Anthropic::Beta::Organization::BetaGCPExternalStorageConfigParam
              )
            )
          end
          attr_accessor :provider_config

          # Human-friendly display name.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_name

          # The user profile to bind the storage to. It can't be changed later. The storage
          # can be attached only to Workspaces with this profile, and the bucket's setup
          # must name the same ID.
          sig { returns(T.nilable(String)) }
          attr_accessor :user_profile_id

          # This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
          sig do
            returns(
              T.nilable(
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              )
            )
          end
          attr_reader :betas

          sig do
            params(
              betas: T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
            ).void
          end
          attr_writer :betas

          sig do
            params(
              provider_config:
                T.any(
                  Anthropic::Beta::Organization::BetaAWSExternalStorageConfigParam::OrHash,
                  Anthropic::Beta::Organization::BetaGCPExternalStorageConfigParam::OrHash
                ),
              display_name: T.nilable(String),
              user_profile_id: T.nilable(String),
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            provider_config:,
            # Human-friendly display name.
            display_name: nil,
            # The user profile to bind the storage to. It can't be changed later. The storage
            # can be attached only to Workspaces with this profile, and the bucket's setup
            # must name the same ID.
            user_profile_id: nil,
            # This endpoint is in beta: requests must send `efs-2026-10-01` in this header.
            betas: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                provider_config:
                  T.any(
                    Anthropic::Beta::Organization::BetaAWSExternalStorageConfigParam,
                    Anthropic::Beta::Organization::BetaGCPExternalStorageConfigParam
                  ),
                display_name: T.nilable(String),
                user_profile_id: T.nilable(String),
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          module ProviderConfig
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaAWSExternalStorageConfigParam,
                  Anthropic::Beta::Organization::BetaGCPExternalStorageConfigParam
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::ExternalStorageCreateParams::ProviderConfig::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AWS =
                T.let(
                  :aws,
                  Anthropic::Beta::Organization::ExternalStorageCreateParams::ProviderConfig::Type::TaggedSymbol
                )
              GCP =
                T.let(
                  :gcp,
                  Anthropic::Beta::Organization::ExternalStorageCreateParams::ProviderConfig::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::ExternalStorageCreateParams::ProviderConfig::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::ExternalStorageCreateParams::ProviderConfig::Variants
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
                  Anthropic::Beta::Organization::ExternalStorageCreateParams::ProviderConfig::Type::OrSymbol,
                bucket_name: String,
                region: String,
                account_id: String,
                project_number: String
              ).returns(
                Anthropic::Beta::Organization::ExternalStorageCreateParams::ProviderConfig::Variants
              )
            end
            def self.new(
              type:,
              # The bucket's name, without `s3://`: 3 to 63 lower-case letters, digits and
              # hyphens, starting and ending with a letter or digit.
              bucket_name:,
              # The bucket's AWS region. Activating the storage fails if Anthropic can't use
              # buckets in that region.
              region:,
              # 12-digit ID of the AWS account that owns the bucket.
              account_id: nil,
              # Project number, not project ID, of the Google Cloud project that holds the
              # bucket.
              project_number: nil
            )
            end
          end
        end
      end
    end
  end
end
