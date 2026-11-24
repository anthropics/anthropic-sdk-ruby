# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # One region's status for the `cmek` control, discriminated by `type`.
            module BetaGoogleManagedCMEKRegionStatus
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # No key is set for this region.
              variant :not_configured,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionNotConfigured }

              # The region is validating the configured key, or the key has passed validation and the region has not started to apply it.
              variant :pending,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionPending }

              # The configured key passed validation, and the region applies it.
              variant :active,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionActive }

              # The region stopped retrying validation before the configured key passed. To restart validation, send the region a key again. It can be the same key.
              variant :failed,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionFailed }

              # Anthropic has withdrawn or paused its approval of customer-managed keys for this profile, so the region does not apply the control.
              variant :suspended,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionSuspended }

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
              #   @return [Array(Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionNotConfigured, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionPending, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionActive, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionFailed, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionSuspended)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionStatus::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [String, nil] :effective_external_key_id The ID of the External Key that the region applies now (`ekey_...`). While a rep
              #
              #   @option args [String, nil, String] :error Why the latest validation attempt failed. `null` when no attempt has failed.
              #
              #   @option args [Time, nil] :last_checked_at When the region last got a successful answer from Google Cloud KMS for the key,
              #
              #   @option args [Time] :validated_at When the status last became `active`, in RFC 3339 format.
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionNotConfigured, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionPending, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionActive, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionFailed, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionSuspended]
              def self.new(type:, **args)
                case type.to_sym
                when :not_configured
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionNotConfigured.new(**args)
                when :pending
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionPending.new(**args)
                when :active
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionActive.new(**args)
                when :failed
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionFailed.new(**args)
                when :suspended
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionSuspended.new(**args)
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
