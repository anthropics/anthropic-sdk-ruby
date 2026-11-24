# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedRetiredBucket < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The bucket's Cloud Storage name.
              sig { returns(String) }
              attr_accessor :bucket_name

              # When this entry is removed, in RFC 3339 format.
              sig { returns(Time) }
              attr_accessor :expires_at

              # The number of the Google Cloud project that holds the bucket, in decimal.
              sig { returns(String) }
              attr_accessor :project_number

              # The code of the region that retired the bucket.
              sig { returns(String) }
              attr_accessor :region

              # A bucket that a region has retired. Until `expires_at`, keep the bucket and
              # Anthropic's access to it as they were when the bucket passed verification.
              sig do
                params(
                  bucket_name: String,
                  expires_at: Time,
                  project_number: String,
                  region: String
                ).returns(T.attached_class)
              end
              def self.new(
                # The bucket's Cloud Storage name.
                bucket_name:,
                # When this entry is removed, in RFC 3339 format.
                expires_at:,
                # The number of the Google Cloud project that holds the bucket, in decimal.
                project_number:,
                # The code of the region that retired the bucket.
                region:
              )
              end

              sig do
                override.returns(
                  {
                    bucket_name: String,
                    expires_at: Time,
                    project_number: String,
                    region: String
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
