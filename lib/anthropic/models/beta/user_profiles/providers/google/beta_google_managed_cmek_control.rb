# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # The customer-managed encryption key control, discriminated by `type`.
            module BetaGoogleManagedCMEKControl
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # The control is off and has no keys.
              variant :disabled, -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabled }

              # The control is on and has a key for at least one region.
              variant :enabled, -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabled }

              module Type
                extend Anthropic::Internal::Type::Enum

                DISABLED = :disabled
                ENABLED = :enabled

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabled, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabled)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControl::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [Array<Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedRetiredKey>] :retired_keys Keys that a region has retired, earliest `expires_at` first.
              #
              #   @option args [Hash{Symbol=>String}] :external_key_ids The ID of the External Key configured for each region (`ekey_...`), keyed by reg
              #
              #   @option args [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionNotConfigured, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionPending, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionActive, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionFailed, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKRegionSuspended}] :status Each region's status for the control, keyed by region code. A region that your o
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabled, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabled]
              def self.new(type:, **args)
                case type.to_sym
                when :disabled
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabled.new(**args)
                when :enabled
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabled.new(**args)
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
