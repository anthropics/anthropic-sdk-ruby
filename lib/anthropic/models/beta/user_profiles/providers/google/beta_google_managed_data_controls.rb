# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # @see Anthropic::Resources::Beta::UserProfiles::Providers::Google::DataControls#retrieve
            class BetaGoogleManagedDataControls < Anthropic::Internal::Type::BaseModel
              # @!attribute bucket_label_value
              #   The label value that every bucket set up for this profile must have. It never
              #   changes.
              #
              #   @return [String]
              required :bucket_label_value, String

              # @!attribute cmek
              #   The customer-managed encryption key control: the key in the end customer's
              #   Google Cloud KMS that is set for each region.
              #
              #   @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabled, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabled]
              required :cmek,
                       union: -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl }

              # @!attribute storage
              #   The customer-owned storage control: the end customer's Cloud Storage bucket that
              #   is set for each region.
              #
              #   @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabled, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabled]
              required :storage,
                       union: -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl }

              # @!attribute type
              #   Object type. Always `google_managed_data_controls`.
              #
              #   @return [Symbol, :google_managed_data_controls]
              required :type, const: :google_managed_data_controls

              # @!attribute updated_at
              #   When an update last changed a control, or a region's status last changed, in RFC
              #   3339 format. A region that starts or stops reading `suspended`, a change to
              #   `last_checked_at` alone, and the removal of a retired entry do not count.
              #
              #   @return [Time]
              required :updated_at, Time

              # @!attribute user_profile_id
              #   The ID of the user profile that these controls belong to (`uprof_...`).
              #
              #   @return [String]
              required :user_profile_id, String

              # @!method initialize(bucket_label_value:, cmek:, storage:, updated_at:, user_profile_id:, type: :google_managed_data_controls)
              #   A user profile's encryption key and storage bucket settings for Claude on Google
              #   Cloud's Agent Platform. Every user profile has one of these objects. You can
              #   read and update it, but not create or delete it. Keys and buckets are set for
              #   each region. A request's region depends on the Google endpoint it is sent to:
              #   `us` is the US multi-region endpoint and the regional endpoint of every location
              #   whose name starts with `us-`, `eu` is the EU multi-region endpoint and the
              #   regional endpoint of every location whose name starts with `europe-`, `sg` is
              #   the `asia-southeast1` regional endpoint, and `global` is the global endpoint,
              #   wherever Google serves the request. Anthropic may add regions.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedDataControls}
              #   for more details.
              #
              #   @param bucket_label_value [String] The label value that every bucket set up for this profile must have. It never ch
              #
              #   @param cmek [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabled, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabled] The customer-managed encryption key control: the key in the end customer's Googl
              #
              #   @param storage [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabled, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabled] The customer-owned storage control: the end customer's Cloud Storage bucket that
              #
              #   @param updated_at [Time] When an update last changed a control, or a region's status last changed, in RFC
              #
              #   @param user_profile_id [String] The ID of the user profile that these controls belong to (`uprof_...`).
              #
              #   @param type [Symbol, :google_managed_data_controls] Object type. Always `google_managed_data_controls`.
            end
          end
        end
      end
    end
  end
end
