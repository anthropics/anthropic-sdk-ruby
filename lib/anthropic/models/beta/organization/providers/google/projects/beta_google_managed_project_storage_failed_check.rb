# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageFailedCheck < Anthropic::Internal::Type::BaseModel
                # @!attribute check
                #   Which check failed, such as `label_mismatch` or `grant_mismatch`. Anthropic may
                #   add values.
                #
                #   @return [Symbol, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck::Check]
                required :check,
                         enum: -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck::Check }

                # @!attribute message
                #   What failed and, where you can fix it, what to change.
                #
                #   @return [String]
                required :message, String

                # @!attribute role
                #   On a check about one of the accounts that Anthropic uses to reach the bucket,
                #   that account's kind of access, such as `ingest`. `null` on any other check.
                #   Anthropic may add values.
                #
                #   @return [Symbol, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck::Role, nil]
                required :role,
                         enum: -> {
                           Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck::Role
                         },
                         nil?: true

                # @!method initialize(check:, message:, role:)
                #   One check that a verification attempt failed.
                #
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck}
                #   for more details.
                #
                #   @param check [Symbol, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck::Check] Which check failed, such as `label_mismatch` or `grant_mismatch`. Anthropic may
                #
                #   @param message [String] What failed and, where you can fix it, what to change.
                #
                #   @param role [Symbol, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck::Role, nil] On a check about one of the accounts that Anthropic uses to reach the bucket, th

                # Which check failed, such as `label_mismatch` or `grant_mismatch`. Anthropic may
                # add values.
                #
                # @see Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck#check
                module Check
                  extend Anthropic::Internal::Type::Enum

                  BUCKET_SETTINGS = :bucket_settings
                  DELETION_POLICY = :deletion_policy
                  ENCRYPTION = :encryption
                  GRANT_MISMATCH = :grant_mismatch
                  KMS_KEY_REFUSED = :kms_key_refused
                  LABEL_MISMATCH = :label_mismatch
                  LIFECYCLE_RULES = :lifecycle_rules
                  LOCATION_MISMATCH = :location_mismatch
                  PROBE_FAILED = :probe_failed
                  PROJECT_NOT_VERIFIED = :project_not_verified
                  VERSIONING = :versioning

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                # On a check about one of the accounts that Anthropic uses to reach the bucket,
                # that account's kind of access, such as `ingest`. `null` on any other check.
                # Anthropic may add values.
                #
                # @see Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck#role
                module Role
                  extend Anthropic::Internal::Type::Enum

                  INGEST = :ingest
                  MAINTENANCE = :maintenance
                  MEDIA_ERASURE = :media_erasure
                  READ = :read
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
end
