# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageFailedCheck < Anthropic::Internal::Type::BaseModel
              # @!attribute check
              #   Which check failed, such as `label_mismatch` or `grant_mismatch`. Anthropic may
              #   add values.
              #
              #   @return [Symbol, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check]
              required :check,
                       enum: -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check }

              # @!attribute message
              #   What failed and, where the end customer can fix it, what to change.
              #
              #   @return [String]
              required :message, String

              # @!attribute role
              #   On a check about one of the accounts that Anthropic uses to reach the bucket,
              #   that account's kind of access, such as `ingest`. `null` on any other check.
              #   Anthropic may add values.
              #
              #   @return [Symbol, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role, nil]
              required :role,
                       enum: -> {
                         Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role
                       },
                       nil?: true

              # @!method initialize(check:, message:, role:)
              #   One check that a verification attempt failed.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck}
              #   for more details.
              #
              #   @param check [Symbol, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Check] Which check failed, such as `label_mismatch` or `grant_mismatch`. Anthropic may
              #
              #   @param message [String] What failed and, where the end customer can fix it, what to change.
              #
              #   @param role [Symbol, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck::Role, nil] On a check about one of the accounts that Anthropic uses to reach the bucket, th

              # Which check failed, such as `label_mismatch` or `grant_mismatch`. Anthropic may
              # add values.
              #
              # @see Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck#check
              module Check
                extend Anthropic::Internal::Type::Enum

                LABEL_MISMATCH = :label_mismatch
                LOCATION_MISMATCH = :location_mismatch
                ENCRYPTION = :encryption
                VERSIONING = :versioning
                BUCKET_SETTINGS = :bucket_settings
                LIFECYCLE_RULES = :lifecycle_rules
                DELETION_POLICY = :deletion_policy
                GRANT_MISMATCH = :grant_mismatch
                KMS_KEY_REFUSED = :kms_key_refused
                PROBE_FAILED = :probe_failed
                PROJECT_NOT_VERIFIED = :project_not_verified

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # On a check about one of the accounts that Anthropic uses to reach the bucket,
              # that account's kind of access, such as `ingest`. `null` on any other check.
              # Anthropic may add values.
              #
              # @see Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck#role
              module Role
                extend Anthropic::Internal::Type::Enum

                INGEST = :ingest
                READ = :read
                MAINTENANCE = :maintenance
                MEDIA_ERASURE = :media_erasure
                VERIFY = :verify

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end
        end
      end
    end
  end
end
