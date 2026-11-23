# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaExternalStorageFailedCheck < Anthropic::Internal::Type::BaseModel
          # @!attribute check
          #   Name of the check that failed, such as `versioning`, for code to branch on. New
          #   names may be added; `other` is a check this API does not name. The value is a
          #   name with no data of its own.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaExternalStorageFailedCheck::Check]
          required :check, enum: -> { Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Check }

          # @!attribute message
          #   What failed and how to fix it, in plain words.
          #
          #   @return [String]
          required :message, String

          # @!attribute role
          #   The part of your access grant that the check is about, such as `ingest`: on AWS,
          #   one of the IAM roles your setup created; on Google Cloud, the grant to one of
          #   Anthropic's service accounts. `null` when the check is not about one. New names
          #   may be added. The value is a name with no data of its own.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaExternalStorageFailedCheck::Role, nil]
          required :role,
                   enum: -> { Anthropic::Beta::Organization::BetaExternalStorageFailedCheck::Role },
                   nil?: true

          # @!method initialize(check:, message:, role:)
          #   One check that an External Storage's verification failed.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaExternalStorageFailedCheck} for more
          #   details.
          #
          #   @param check [Symbol, Anthropic::Models::Beta::Organization::BetaExternalStorageFailedCheck::Check] Name of the check that failed, such as `versioning`, for code to branch on. New
          #
          #   @param message [String] What failed and how to fix it, in plain words.
          #
          #   @param role [Symbol, Anthropic::Models::Beta::Organization::BetaExternalStorageFailedCheck::Role, nil] The part of your access grant that the check is about, such as `ingest`: on AWS,

          # Name of the check that failed, such as `versioning`, for code to branch on. New
          # names may be added; `other` is a check this API does not name. The value is a
          # name with no data of its own.
          #
          # @see Anthropic::Models::Beta::Organization::BetaExternalStorageFailedCheck#check
          module Check
            extend Anthropic::Internal::Type::Enum

            ALREADY_REGISTERED = :already_registered
            ASSUME_ROLE = :assume_role
            BUCKET_EMPTY = :bucket_empty
            BUCKET_NOT_CONFIRMED = :bucket_not_confirmed
            BUCKET_POLICY = :bucket_policy
            BUCKET_SETTINGS = :bucket_settings
            DEFAULT_ENCRYPTION = :default_encryption
            DELETION_POLICY = :deletion_policy
            ENCRYPTION = :encryption
            GRANT_MISMATCH = :grant_mismatch
            KEY_USABLE = :key_usable
            KMS_KEY_REFUSED = :kms_key_refused
            LIFECYCLE_NO_ARCHIVE = :lifecycle_no_archive
            LIFECYCLE_RULES = :lifecycle_rules
            LIFECYCLE_TEMPLATE = :lifecycle_template
            LOCATION_MISMATCH = :location_mismatch
            OBJECT_LOCK = :object_lock
            OTHER = :other
            OWNERSHIP_ENFORCED = :ownership_enforced
            PROBE_FAILED = :probe_failed
            PROBE_OBJECT = :probe_object
            PROBE_STORAGE_CLASS = :probe_storage_class
            PUBLIC_ACCESS_BLOCK = :public_access_block
            REGION = :region
            REPLICATION = :replication
            REQUEST_METRICS = :request_metrics
            REQUEST_PAYMENT = :request_payment
            TRANSCRIPTS_SUPPORT = :transcripts_support
            TRUST_INGEST_ROLE = :trust_ingest_role
            TRUST_MAINTENANCE_ROLE = :trust_maintenance_role
            TRUST_MEDIA_ERASURE_ROLE = :trust_media_erasure_role
            TRUST_READ_ROLE = :trust_read_role
            TRUST_TRANSCRIPTS_ROLE = :trust_transcripts_role
            TRUST_TRANSCRIPTS_VERIFY_ROLE = :trust_transcripts_verify_role
            TRUST_VERIFY_ROLE = :trust_verify_role
            VERSIONING = :versioning

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The part of your access grant that the check is about, such as `ingest`: on AWS,
          # one of the IAM roles your setup created; on Google Cloud, the grant to one of
          # Anthropic's service accounts. `null` when the check is not about one. New names
          # may be added. The value is a name with no data of its own.
          #
          # @see Anthropic::Models::Beta::Organization::BetaExternalStorageFailedCheck#role
          module Role
            extend Anthropic::Internal::Type::Enum

            INGEST = :ingest
            MAINTENANCE = :maintenance
            MEDIA_ERASURE = :media_erasure
            READ = :read
            TRANSCRIPTS = :transcripts
            TRANSCRIPTS_VERIFY = :transcripts_verify
            VERIFY = :verify

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
