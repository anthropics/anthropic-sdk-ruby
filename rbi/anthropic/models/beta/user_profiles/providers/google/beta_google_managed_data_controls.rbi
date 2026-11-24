# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedDataControls < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedDataControls,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The label value that every bucket set up for this profile must have. It never
              # changes.
              sig { returns(String) }
              attr_accessor :bucket_label_value

              # The customer-managed encryption key control: the key in the end customer's
              # Google Cloud KMS that is set for each region.
              sig do
                returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl::Variants
                )
              end
              attr_accessor :cmek

              # The customer-owned storage control: the end customer's Cloud Storage bucket that
              # is set for each region.
              sig do
                returns(
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl::Variants
                )
              end
              attr_accessor :storage

              # Object type. Always `google_managed_data_controls`.
              sig { returns(Symbol) }
              attr_accessor :type

              # When an update last changed a control, or a region's status last changed, in RFC
              # 3339 format. A region that starts or stops reading `suspended`, a change to
              # `last_checked_at` alone, and the removal of a retired entry do not count.
              sig { returns(Time) }
              attr_accessor :updated_at

              # The ID of the user profile that these controls belong to (`uprof_...`).
              sig { returns(String) }
              attr_accessor :user_profile_id

              # A user profile's encryption key and storage bucket settings for Claude on Google
              # Cloud's Agent Platform. Every user profile has one of these objects. You can
              # read and update it, but not create or delete it. Keys and buckets are set for
              # each region. A request's region depends on the Google endpoint it is sent to:
              # `us` is the US multi-region endpoint and the regional endpoint of every location
              # whose name starts with `us-`, `eu` is the EU multi-region endpoint and the
              # regional endpoint of every location whose name starts with `europe-`, `sg` is
              # the `asia-southeast1` regional endpoint, and `global` is the global endpoint,
              # wherever Google serves the request. Anthropic may add regions.
              sig do
                params(
                  bucket_label_value: String,
                  cmek:
                    T.any(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabled::OrHash,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabled::OrHash
                    ),
                  storage:
                    T.any(
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabled::OrHash,
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabled::OrHash
                    ),
                  updated_at: Time,
                  user_profile_id: String,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # The label value that every bucket set up for this profile must have. It never
                # changes.
                bucket_label_value:,
                # The customer-managed encryption key control: the key in the end customer's
                # Google Cloud KMS that is set for each region.
                cmek:,
                # The customer-owned storage control: the end customer's Cloud Storage bucket that
                # is set for each region.
                storage:,
                # When an update last changed a control, or a region's status last changed, in RFC
                # 3339 format. A region that starts or stops reading `suspended`, a change to
                # `last_checked_at` alone, and the removal of a retired entry do not count.
                updated_at:,
                # The ID of the user profile that these controls belong to (`uprof_...`).
                user_profile_id:,
                # Object type. Always `google_managed_data_controls`.
                type: :google_managed_data_controls
              )
              end

              sig do
                override.returns(
                  {
                    bucket_label_value: String,
                    cmek:
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl::Variants,
                    storage:
                      Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl::Variants,
                    type: Symbol,
                    updated_at: Time,
                    user_profile_id: String
                  }
                )
              end
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
