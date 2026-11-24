# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              # The customer-managed encryption key control: the key in your Google Cloud KMS
              # that is set for each region. It covers the project's requests that name no user
              # profile, or a user profile that has no key of its own for the project.
              module BetaGoogleManagedProjectCMEKControl
                extend Anthropic::Internal::Type::Union

                discriminator :type

                # The control is off and has no keys.
                variant :disabled,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabled }

                # The control is on and has a key for at least one region.
                variant :enabled,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabled }

                module Type
                  extend Anthropic::Internal::Type::Enum

                  DISABLED = :disabled
                  ENABLED = :enabled

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                # @!method self.variants
                #   @return [Array(Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabled, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabled)]

                # Creates a new instance of the variant class whose `type` matches the given
                # value, passing the remaining arguments to its constructor.
                #
                # Some parameter documentations has been truncated, see
                # {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl}
                # for more details.
                #
                # @param type [Symbol, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControl::Type, String]
                #
                # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
                #
                #   @option args [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredKey>] :retired_keys Keys that a region has retired, earliest `expires_at` first.
                #
                #   @option args [Hash{Symbol=>String}] :external_key_ids The ID of the External Key configured for each region (`ekey_...`), keyed by reg
                #
                #   @option args [Hash{Symbol=>Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionNotConfigured, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionPending, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionActive, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionFailed, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKRegionSuspended}] :status Each region's status for the control, keyed by region code. A region that your o
                #
                # @raise [ArgumentError]
                # @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabled, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabled]
                def self.new(type:, **args)
                  case type.to_sym
                  when :disabled
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabled.new(
                      **args
                    )
                  when :enabled
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabled.new(
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
