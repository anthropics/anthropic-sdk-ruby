# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageBucket < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageBucket,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The bucket's Cloud Storage name.
                sig { returns(String) }
                attr_accessor :bucket_name

                # The resource name of the Cloud KMS key that the bucket encrypts objects under by
                # default. `null` until the region has confirmed the bucket, and when the bucket
                # has no default key.
                sig { returns(T.nilable(String)) }
                attr_accessor :kms_key_name

                # The bucket's location, as Cloud Storage reports it. `null` until the region has
                # confirmed the bucket.
                sig { returns(T.nilable(String)) }
                attr_accessor :location

                # The ID of the project that holds the bucket. `null` until the region has
                # confirmed the bucket.
                sig { returns(T.nilable(String)) }
                attr_accessor :project_id

                # The number of the Google Cloud project that holds the bucket, in decimal.
                sig { returns(String) }
                attr_accessor :project_number

                # The bucket configured for a region.
                sig do
                  params(
                    bucket_name: String,
                    kms_key_name: T.nilable(String),
                    location: T.nilable(String),
                    project_id: T.nilable(String),
                    project_number: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The bucket's Cloud Storage name.
                  bucket_name:,
                  # The resource name of the Cloud KMS key that the bucket encrypts objects under by
                  # default. `null` until the region has confirmed the bucket, and when the bucket
                  # has no default key.
                  kms_key_name:,
                  # The bucket's location, as Cloud Storage reports it. `null` until the region has
                  # confirmed the bucket.
                  location:,
                  # The ID of the project that holds the bucket. `null` until the region has
                  # confirmed the bucket.
                  project_id:,
                  # The number of the Google Cloud project that holds the bucket, in decimal.
                  project_number:
                )
                end

                sig do
                  override.returns(
                    {
                      bucket_name: String,
                      kms_key_name: T.nilable(String),
                      location: T.nilable(String),
                      project_id: T.nilable(String),
                      project_number: String
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
end
