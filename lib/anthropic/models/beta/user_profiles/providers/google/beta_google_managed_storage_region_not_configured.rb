# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            class BetaGoogleManagedStorageRegionNotConfigured < Anthropic::Internal::Type::BaseModel
              # @!attribute effective_bucket
              #   The bucket that the region applies now. While a replacement bucket is `pending`
              #   or `failed`, this is the previous bucket. `null` when the region applies no
              #   bucket.
              #
              #   @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference, nil]
              required :effective_bucket,
                       -> {
                         Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference
                       },
                       nil?: true

              # @!attribute type
              #
              #   @return [Symbol, :not_configured]
              required :type, const: :not_configured

              # @!method initialize(effective_bucket:, type: :not_configured)
              #   No bucket is set for this region.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionNotConfigured}
              #   for more details.
              #
              #   @param effective_bucket [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference, nil] The bucket that the region applies now. While a replacement bucket is `pending`
              #
              #   @param type [Symbol, :not_configured]
            end
          end
        end
      end
    end
  end
end
