# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              class BetaGoogleManagedProjectStorageRegionSuspended < Anthropic::Internal::Type::BaseModel
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

                # @!attribute type
                #
                #   @return [Symbol, :suspended]
                required :type, const: :suspended

                # @!method initialize(effective_bucket:, type: :suspended)
                #   Anthropic has withdrawn or paused its approval of customer-owned storage for
                #   this project, so the region does not apply the control.
                #
                #   Some parameter documentations has been truncated, see
                #   {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended}
                #   for more details.
                #
                #   @param effective_bucket [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket, nil] The bucket that the region applies now. While a replacement bucket is `pending`
                #
                #   @param type [Symbol, :suspended]
              end
            end
          end
        end
      end
    end
  end
end
