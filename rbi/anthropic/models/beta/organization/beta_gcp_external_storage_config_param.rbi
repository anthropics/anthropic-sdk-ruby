# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaGCPExternalStorageConfigParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaGCPExternalStorageConfigParam,
                Anthropic::Internal::AnyHash
              )
            end

          # The bucket's name, without `gs://`: 3 to 63 lower-case letters, digits and
          # hyphens, starting and ending with a letter or digit. It can't start with `goog`
          # or contain `google`.
          sig { returns(String) }
          attr_accessor :bucket_name

          # Project number, not project ID, of the Google Cloud project that holds the
          # bucket.
          sig { returns(String) }
          attr_accessor :project_number

          # The bucket's Google Cloud region, such as `us-east5`: one of the single regions
          # that the setup guide lists. Dual-regions and multi-regions aren't supported.
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
            # The bucket's name, without `gs://`: 3 to 63 lower-case letters, digits and
            # hyphens, starting and ending with a letter or digit. It can't start with `goog`
            # or contain `google`.
            bucket_name:,
            # Project number, not project ID, of the Google Cloud project that holds the
            # bucket.
            project_number:,
            # The bucket's Google Cloud region, such as `us-east5`: one of the single regions
            # that the setup guide lists. Dual-regions and multi-regions aren't supported.
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
