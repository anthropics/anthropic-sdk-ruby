# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorageFailedCheck < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck,
                Anthropic::Internal::AnyHash
              )
            end

          # Name of the check that failed, such as `versioning`, for code to branch on. New
          # names may be added; `other` is a check this API does not name. The value is a
          # name with no data of its own.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
            )
          end
          attr_accessor :check

          # What failed and how to fix it, in plain words.
          sig { returns(String) }
          attr_accessor :message

          # The part of your access grant that the check is about, such as `ingest`: on AWS,
          # one of the IAM roles your setup created; on Google Cloud, the grant to one of
          # Anthropic's service accounts. `null` when the check is not about one. New names
          # may be added. The value is a name with no data of its own.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::TaggedSymbol
              )
            )
          end
          attr_accessor :role

          # One check that an External Storage's verification failed.
          sig do
            params(
              check:
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::OrSymbol,
              message: String,
              role:
                T.nilable(
                  Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::OrSymbol
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Name of the check that failed, such as `versioning`, for code to branch on. New
            # names may be added; `other` is a check this API does not name. The value is a
            # name with no data of its own.
            check:,
            # What failed and how to fix it, in plain words.
            message:,
            # The part of your access grant that the check is about, such as `ingest`: on AWS,
            # one of the IAM roles your setup created; on Google Cloud, the grant to one of
            # Anthropic's service accounts. `null` when the check is not about one. New names
            # may be added. The value is a name with no data of its own.
            role:
          )
          end

          sig do
            override.returns(
              {
                check:
                  Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol,
                message: String,
                role:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::TaggedSymbol
                  )
              }
            )
          end
          def to_hash
          end

          # Name of the check that failed, such as `versioning`, for code to branch on. New
          # names may be added; `other` is a check this API does not name. The value is a
          # name with no data of its own.
          module Check
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALREADY_REGISTERED =
              T.let(
                :already_registered,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            ASSUME_ROLE =
              T.let(
                :assume_role,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            BUCKET_EMPTY =
              T.let(
                :bucket_empty,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            BUCKET_NOT_CONFIRMED =
              T.let(
                :bucket_not_confirmed,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            BUCKET_POLICY =
              T.let(
                :bucket_policy,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            BUCKET_SETTINGS =
              T.let(
                :bucket_settings,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            DEFAULT_ENCRYPTION =
              T.let(
                :default_encryption,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            DELETION_POLICY =
              T.let(
                :deletion_policy,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            ENCRYPTION =
              T.let(
                :encryption,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            GRANT_MISMATCH =
              T.let(
                :grant_mismatch,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            KEY_USABLE =
              T.let(
                :key_usable,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            KMS_KEY_REFUSED =
              T.let(
                :kms_key_refused,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            LIFECYCLE_NO_ARCHIVE =
              T.let(
                :lifecycle_no_archive,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            LIFECYCLE_RULES =
              T.let(
                :lifecycle_rules,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            LIFECYCLE_TEMPLATE =
              T.let(
                :lifecycle_template,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            LOCATION_MISMATCH =
              T.let(
                :location_mismatch,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            OBJECT_LOCK =
              T.let(
                :object_lock,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            OTHER =
              T.let(
                :other,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            OWNERSHIP_ENFORCED =
              T.let(
                :ownership_enforced,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            PROBE_FAILED =
              T.let(
                :probe_failed,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            PROBE_OBJECT =
              T.let(
                :probe_object,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            PROBE_STORAGE_CLASS =
              T.let(
                :probe_storage_class,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            PUBLIC_ACCESS_BLOCK =
              T.let(
                :public_access_block,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            REGION =
              T.let(
                :region,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            REPLICATION =
              T.let(
                :replication,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            REQUEST_METRICS =
              T.let(
                :request_metrics,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            REQUEST_PAYMENT =
              T.let(
                :request_payment,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            TRANSCRIPTS_SUPPORT =
              T.let(
                :transcripts_support,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            TRUST_INGEST_ROLE =
              T.let(
                :trust_ingest_role,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            TRUST_MAINTENANCE_ROLE =
              T.let(
                :trust_maintenance_role,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            TRUST_MEDIA_ERASURE_ROLE =
              T.let(
                :trust_media_erasure_role,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            TRUST_READ_ROLE =
              T.let(
                :trust_read_role,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            TRUST_TRANSCRIPTS_ROLE =
              T.let(
                :trust_transcripts_role,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            TRUST_TRANSCRIPTS_VERIFY_ROLE =
              T.let(
                :trust_transcripts_verify_role,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            TRUST_VERIFY_ROLE =
              T.let(
                :trust_verify_role,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )
            VERSIONING =
              T.let(
                :versioning,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # The part of your access grant that the check is about, such as `ingest`: on AWS,
          # one of the IAM roles your setup created; on Google Cloud, the grant to one of
          # Anthropic's service accounts. `null` when the check is not about one. New names
          # may be added. The value is a name with no data of its own.
          module Role
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INGEST =
              T.let(
                :ingest,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::TaggedSymbol
              )
            MAINTENANCE =
              T.let(
                :maintenance,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::TaggedSymbol
              )
            MEDIA_ERASURE =
              T.let(
                :media_erasure,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::TaggedSymbol
              )
            READ =
              T.let(
                :read,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::TaggedSymbol
              )
            TRANSCRIPTS =
              T.let(
                :transcripts,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::TaggedSymbol
              )
            TRANSCRIPTS_VERIFY =
              T.let(
                :transcripts_verify,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::TaggedSymbol
              )
            VERIFY =
              T.let(
                :verify,
                Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role::TaggedSymbol
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
end
