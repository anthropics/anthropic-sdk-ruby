# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageEnabledParams < Anthropic::Internal::Type::BaseModel
              # @!attribute type
              #
              #   @return [Symbol, :enabled]
              required :type, const: :enabled

              # @!attribute buckets
              #   The bucket to use in each region, keyed by region code, such as `us` or `eu`. An
              #   object with `project_number` and `bucket_name` sets that region's bucket, `null`
              #   removes it, and a region you leave out keeps its bucket. A bucket can serve only
              #   one region. While the control is on, at least one region must have a bucket.
              #
              #   @return [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference, nil}, nil]
              optional :buckets,
                       -> { Anthropic::Internal::Type::HashOf[Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference, nil?: true] }

              # @!method initialize(buckets: nil, type: :enabled)
              #   Turns the control on, or changes its buckets while it is on.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams}
              #   for more details.
              #
              #   @param buckets [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference, nil}] The bucket to use in each region, keyed by region code, such as `us` or `eu`. An
              #
              #   @param type [Symbol, :enabled]
            end
          end
        end
      end
    end
  end
end
