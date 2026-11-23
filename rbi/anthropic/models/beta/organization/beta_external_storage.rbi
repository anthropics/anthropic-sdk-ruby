# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorage < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaExternalStorage,
                Anthropic::Internal::AnyHash
              )
            end

          # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
          # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
          # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
          # partition of the bucket's region.
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Time) }
          attr_accessor :created_at

          # Human-friendly display name. Null if none was set.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_name

          sig do
            returns(
              Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig::Variants
            )
          end
          attr_accessor :provider_config

          # The version of Anthropic's setup template whose IAM role names this storage was
          # found to use at activation. Null if no version was recorded, as for storage not
          # yet activated or not on S3.
          sig { returns(T.nilable(String)) }
          attr_accessor :setup_template_version

          sig do
            returns(
              Anthropic::Beta::Organization::BetaExternalStorage::Status::Variants
            )
          end
          attr_accessor :status

          sig { returns(Symbol) }
          attr_accessor :type

          sig { returns(Time) }
          attr_accessor :updated_at

          # The user profile the storage is bound to, or null.
          sig { returns(T.nilable(String)) }
          attr_accessor :user_profile_id

          # A storage bucket in the organization's own cloud account. Anthropic writes
          # inference data to it from each Workspace it is attached to.
          sig do
            params(
              id: String,
              created_at: Time,
              display_name: T.nilable(String),
              provider_config:
                T.any(
                  Anthropic::Beta::Organization::BetaAWSExternalStorageConfig::OrHash,
                  Anthropic::Beta::Organization::BetaGCPExternalStorageConfig::OrHash
                ),
              setup_template_version: T.nilable(String),
              status:
                T.any(
                  Anthropic::Beta::Organization::BetaPendingConfigurationExternalStorageStatus::OrHash,
                  Anthropic::Beta::Organization::BetaAvailableExternalStorageStatus::OrHash,
                  Anthropic::Beta::Organization::BetaActiveExternalStorageStatus::OrHash,
                  Anthropic::Beta::Organization::BetaDrainingExternalStorageStatus::OrHash
                ),
              updated_at: Time,
              user_profile_id: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The External Storage ID, which starts with `estrg_`. Through Claude Platform on
            # AWS, storage whose `provider_config.type` is `aws` has its bucket ARN as its ID
            # instead: `arn:<partition>:s3:::<bucket_name>`, where `<partition>` is the
            # partition of the bucket's region.
            id:,
            created_at:,
            # Human-friendly display name. Null if none was set.
            display_name:,
            provider_config:,
            # The version of Anthropic's setup template whose IAM role names this storage was
            # found to use at activation. Null if no version was recorded, as for storage not
            # yet activated or not on S3.
            setup_template_version:,
            status:,
            updated_at:,
            # The user profile the storage is bound to, or null.
            user_profile_id:,
            type: :external_storage
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                display_name: T.nilable(String),
                provider_config:
                  Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig::Variants,
                setup_template_version: T.nilable(String),
                status:
                  Anthropic::Beta::Organization::BetaExternalStorage::Status::Variants,
                type: Symbol,
                updated_at: Time,
                user_profile_id: T.nilable(String)
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
                  Anthropic::Beta::Organization::BetaAWSExternalStorageConfig,
                  Anthropic::Beta::Organization::BetaGCPExternalStorageConfig
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AWS =
                T.let(
                  :aws,
                  Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig::Type::TaggedSymbol
                )
              GCP =
                T.let(
                  :gcp,
                  Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig::Variants
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
                  Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig::Type::OrSymbol,
                bucket_name: String,
                region: String,
                account_id: String,
                project_number: String
              ).returns(
                Anthropic::Beta::Organization::BetaExternalStorage::ProviderConfig::Variants
              )
            end
            def self.new(
              type:,
              # The bucket's name, without `s3://`.
              bucket_name:,
              # The bucket's AWS region.
              region:,
              # 12-digit ID of the AWS account that owns the bucket.
              account_id: nil,
              # Number of the Google Cloud project that holds the bucket.
              project_number: nil
            )
            end
          end

          module Status
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaPendingConfigurationExternalStorageStatus,
                  Anthropic::Beta::Organization::BetaAvailableExternalStorageStatus,
                  Anthropic::Beta::Organization::BetaActiveExternalStorageStatus,
                  Anthropic::Beta::Organization::BetaDrainingExternalStorageStatus
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaExternalStorage::Status::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PENDING_CONFIGURATION =
                T.let(
                  :pending_configuration,
                  Anthropic::Beta::Organization::BetaExternalStorage::Status::Type::TaggedSymbol
                )
              AVAILABLE =
                T.let(
                  :available,
                  Anthropic::Beta::Organization::BetaExternalStorage::Status::Type::TaggedSymbol
                )
              ACTIVE =
                T.let(
                  :active,
                  Anthropic::Beta::Organization::BetaExternalStorage::Status::Type::TaggedSymbol
                )
              DRAINING =
                T.let(
                  :draining,
                  Anthropic::Beta::Organization::BetaExternalStorage::Status::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaExternalStorage::Status::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaExternalStorage::Status::Variants
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
                  Anthropic::Beta::Organization::BetaExternalStorage::Status::Type::OrSymbol,
                healthy: T::Boolean,
                last_checked_at: Time,
                removal_started: T::Boolean
              ).returns(
                Anthropic::Beta::Organization::BetaExternalStorage::Status::Variants
              )
            end
            def self.new(
              type:,
              # Whether the bucket passed its latest recorded check. It can stay `true` after
              # the bucket stops working, so don't use it for monitoring.
              healthy: nil,
              # When the bucket's latest recorded check ran, in RFC 3339.
              last_checked_at: nil,
              # True once a delete has started removing this storage, which can't be undone. It
              # then can't be attached, and another delete finishes the removal.
              removal_started: nil
            )
            end
          end
        end
      end
    end
  end
end
