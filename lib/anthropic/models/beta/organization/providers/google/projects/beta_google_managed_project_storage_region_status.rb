# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              module BetaGoogleManagedProjectStorageRegionStatus
                extend Anthropic::Internal::Type::Union

                discriminator :type

                # No bucket is set for this region.
                variant :not_configured,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionNotConfigured }

                # The region is verifying the configured bucket.
                variant :pending,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionPending }

                # The configured bucket passed verification, and the region applies it.
                variant :active,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive }

                # The region stopped retrying verification before the configured bucket passed. To restart verification, send the region a bucket again. It can be the same bucket.
                variant :failed,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionFailed }

                # Anthropic has withdrawn or paused its approval of customer-owned storage for this project, so the region does not apply the control.
                variant :suspended,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended }

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
                #   @return [Array(Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionNotConfigured, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionPending, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionFailed, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended)]

                # Creates a new instance of the variant class whose `type` matches the given
                # value, passing the remaining arguments to its constructor.
                #
                # Some parameter documentations has been truncated, see
                # {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus}
                # for more details.
                #
                # @param type [Symbol, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionStatus::Type, String]
                #
                # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
                #
                #   @option args [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectEffectiveBucket, nil] :effective_bucket The bucket that the region applies now. While a replacement bucket is `pending`
                #
                #   @option args [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageFailedCheck>] :failed_checks The checks that the latest reported verification attempt failed. Empty when none
                #
                #   @option args [Time] :validated_at When the status last became `active`, in RFC 3339 format.
                #
                # @raise [ArgumentError]
                # @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionNotConfigured, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionPending, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionFailed, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended]
                def self.new(type:, **args)
                  case type.to_sym
                  when :not_configured
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionNotConfigured.new(
                      **args
                    )
                  when :pending
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionPending.new(
                      **args
                    )
                  when :active
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive.new(
                      **args
                    )
                  when :failed
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionFailed.new(
                      **args
                    )
                  when :suspended
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended.new(
                      **args
                    )
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
end
