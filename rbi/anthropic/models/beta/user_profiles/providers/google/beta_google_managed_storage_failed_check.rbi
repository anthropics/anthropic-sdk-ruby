# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageFailedCheck < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck,
                    Anthropic::Internal::AnyHash
                  )
                end

              # Which check failed, such as `label_mismatch` or `grant_mismatch`. Anthropic may
              # add values.
              sig do
                returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                )
              end
              attr_accessor :check

              # What failed and, where the end customer can fix it, what to change.
              sig { returns(String) }
              attr_accessor :message

              # On a check about one of the accounts that Anthropic uses to reach the bucket,
              # that account's kind of access, such as `ingest`. `null` on any other check.
              # Anthropic may add values.
              sig do
                returns(
                  T.nilable(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role::TaggedSymbol
                  )
                )
              end
              attr_accessor :role

              # One check that a verification attempt failed.
              sig do
                params(
                  check:
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::OrSymbol,
                  message: String,
                  role:
                    T.nilable(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role::OrSymbol
                    )
                ).returns(T.attached_class)
              end
              def self.new(
                # Which check failed, such as `label_mismatch` or `grant_mismatch`. Anthropic may
                # add values.
                check:,
                # What failed and, where the end customer can fix it, what to change.
                message:,
                # On a check about one of the accounts that Anthropic uses to reach the bucket,
                # that account's kind of access, such as `ingest`. `null` on any other check.
                # Anthropic may add values.
                role:
              )
              end

              sig do
                override.returns(
                  {
                    check:
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol,
                    message: String,
                    role:
                      T.nilable(
                        Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role::TaggedSymbol
                      )
                  }
                )
              end
              def to_hash
              end

              # Which check failed, such as `label_mismatch` or `grant_mismatch`. Anthropic may
              # add values.
              module Check
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                LABEL_MISMATCH =
                  T.let(
                    :label_mismatch,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )
                LOCATION_MISMATCH =
                  T.let(
                    :location_mismatch,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )
                ENCRYPTION =
                  T.let(
                    :encryption,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )
                VERSIONING =
                  T.let(
                    :versioning,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )
                BUCKET_SETTINGS =
                  T.let(
                    :bucket_settings,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )
                LIFECYCLE_RULES =
                  T.let(
                    :lifecycle_rules,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )
                DELETION_POLICY =
                  T.let(
                    :deletion_policy,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )
                GRANT_MISMATCH =
                  T.let(
                    :grant_mismatch,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )
                KMS_KEY_REFUSED =
                  T.let(
                    :kms_key_refused,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )
                PROBE_FAILED =
                  T.let(
                    :probe_failed,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )
                PROJECT_NOT_VERIFIED =
                  T.let(
                    :project_not_verified,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # On a check about one of the accounts that Anthropic uses to reach the bucket,
              # that account's kind of access, such as `ingest`. `null` on any other check.
              # Anthropic may add values.
              module Role
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                INGEST =
                  T.let(
                    :ingest,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role::TaggedSymbol
                  )
                READ =
                  T.let(
                    :read,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role::TaggedSymbol
                  )
                MAINTENANCE =
                  T.let(
                    :maintenance,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role::TaggedSymbol
                  )
                MEDIA_ERASURE =
                  T.let(
                    :media_erasure,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role::TaggedSymbol
                  )
                VERIFY =
                  T.let(
                    :verify,
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role::TaggedSymbol
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
  end
end
