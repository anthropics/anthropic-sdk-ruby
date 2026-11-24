# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # One region's status for the `storage` control, discriminated by `type`.
            module BetaGoogleManagedStorageRegionStatus
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # No bucket is set for this region.
              variant :not_configured,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionNotConfigured }

              # The region is verifying the configured bucket.
              variant :pending,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending }

              # The configured bucket passed verification, and the region applies it.
              variant :active,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionActive }

              # The region stopped retrying verification before the configured bucket passed. To restart verification, send the region a bucket again. It can be the same bucket.
              variant :failed,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionFailed }

              # Anthropic has withdrawn or paused its approval of customer-owned storage for this profile, so the region does not apply the control.
              variant :suspended,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionSuspended }

              module Type
                extend Anthropic::Internal::Type::Enum

                NOT_CONFIGURED = :not_configured
                PENDING = :pending
                ACTIVE = :active
                FAILED = :failed
                SUSPENDED = :suspended

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionNotConfigured, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionActive, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionFailed, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionSuspended)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionStatus::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference, nil] :effective_bucket The bucket that the region applies now. While a replacement bucket is `pending`
              #
              #   @option args [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageFailedCheck>] :failed_checks The checks that the latest reported verification attempt failed. Empty when none
              #
              #   @option args [Time] :validated_at When the status last became `active`, in RFC 3339 format.
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionNotConfigured, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionActive, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionFailed, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionSuspended]
              def self.new(type:, **args)
                case type.to_sym
                when :not_configured
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionNotConfigured.new(**args)
                when :pending
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending.new(**args)
                when :active
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionActive.new(**args)
                when :failed
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionFailed.new(**args)
                when :suspended
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionSuspended.new(**args)
                else
                  raise ArgumentError, "unknown type: #{type}"
                end
              end
            end
          end
        end
      end
    end
  end
end
