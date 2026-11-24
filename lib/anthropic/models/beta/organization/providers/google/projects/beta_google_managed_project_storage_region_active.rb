# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageRegionActive < Anthropic::Internal::Type::BaseModel
                # @!attribute effective_bucket
                #   The bucket that the region applies now. While a replacement bucket is `pending`
                #   or `failed`, this is the previous bucket. `null` when the region applies no
                #   bucket.
                #
                #   @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket, nil]
                required :effective_bucket,
                         -> {
                           Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket
                         },
                         nil?: true

                # @!attribute failed_checks
                #   The checks that the latest reported daily verification failed. Empty when it
                #   passed.
                #
                #   @return [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck>]
                required :failed_checks,
                         -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck] }

                # @!attribute type
                #
                #   @return [Symbol, :active]
                required :type, const: :active

                # @!attribute validated_at
                #   When the status last became `active`, in RFC 3339 format.
                #
                #   @return [Time]
                required :validated_at, Time

                # @!method initialize(effective_bucket:, failed_checks:, validated_at:, type: :active)
                #   The configured bucket passed verification, and the region applies it.
                #
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive}
                #   for more details.
                #
                #   @param effective_bucket [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket, nil] The bucket that the region applies now. While a replacement bucket is `pending`
                #
                #   @param failed_checks [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck>] The checks that the latest reported daily verification failed. Empty when it pas
                #
                #   @param validated_at [Time] When the status last became `active`, in RFC 3339 format.
                #
                #   @param type [Symbol, :active]
              end
            end
          end
        end
      end
    end
  end
end
