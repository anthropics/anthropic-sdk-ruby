# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaGCPExternalStorageConfig < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaGCPExternalStorageConfig,
                Anthropic::Internal::AnyHash
              )
            end

          # The bucket's name, without `gs://`.
          sig { returns(String) }
          attr_accessor :bucket_name

          # Number of the Google Cloud project that holds the bucket.
          sig { returns(String) }
          attr_accessor :project_number

          # The bucket's Google Cloud region.
          sig { returns(String) }
          attr_accessor :region

          sig { returns(Symbol) }
          attr_accessor :type

          # A Google Cloud Storage bucket.
          sig do
            params(
              bucket_name: String,
              project_number: String,
              region: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The bucket's name, without `gs://`.
            bucket_name:,
            # Number of the Google Cloud project that holds the bucket.
            project_number:,
            # The bucket's Google Cloud region.
            region:,
            type: :gcp
          )
          end

          sig do
            override.returns(
              {
                bucket_name: String,
                project_number: String,
                region: String,
                type: Symbol
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
