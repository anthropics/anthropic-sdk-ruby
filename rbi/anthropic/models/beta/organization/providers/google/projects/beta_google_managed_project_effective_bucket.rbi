# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectEffectiveBucket < Anthropic::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket,
                      Anthropic::Internal::AnyHash
                    )
                  end

                # The bucket's Cloud Storage name.
                sig { returns(String) }
                attr_accessor :bucket_name

                # The number of the Google Cloud project that holds the bucket, in decimal.
                sig { returns(String) }
                attr_accessor :project_number

                # A Cloud Storage bucket, named by the project that holds it and by its own name.
                sig do
                  params(bucket_name: String, project_number: String).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # The bucket's Cloud Storage name.
                  bucket_name:,
                  # The number of the Google Cloud project that holds the bucket, in decimal.
                  project_number:
                )
                end

                sig do
                  override.returns(
                    { bucket_name: String, project_number: String }
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
