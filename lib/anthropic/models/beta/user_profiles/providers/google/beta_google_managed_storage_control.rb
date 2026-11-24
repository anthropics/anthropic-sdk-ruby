# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # The customer-owned storage control, discriminated by `type`.
            module BetaGoogleManagedStorageControl
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # The control is off and has no buckets.
              variant :disabled,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabled }

              # The control is on and has a bucket for at least one region.
              variant :enabled, -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabled }

              module Type
                extend Anthropic::Internal::Type::Enum

                DISABLED = :disabled
                ENABLED = :enabled

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabled, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabled)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControl::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredBucket>] :retired_buckets Buckets that a region has retired, earliest `expires_at` first.
              #
              #   @option args [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageBucket}] :buckets The bucket configured for each region, keyed by region code. A region with no bu
              #
              #   @option args [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionNotConfigured, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionPending, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionActive, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionFailed, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageRegionSuspended}] :status Each region's status for the control, keyed by region code. A region that your o
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabled, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabled]
              def self.new(type:, **args)
                case type.to_sym
                when :disabled
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabled.new(**args)
                when :enabled
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabled.new(**args)
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
