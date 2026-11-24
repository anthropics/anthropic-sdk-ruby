# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              # The customer-owned storage control: your Cloud Storage bucket that is set for
              # each region. It covers the project's requests that name no user profile, or a
              # user profile that has no bucket of its own for the project.
              module BetaGoogleManagedProjectStorageControl
                extend Anthropic::Internal::Type::Union

                discriminator :type

                # The control is off and has no buckets.
                variant :disabled,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabled }

                # The control is on and has a bucket for at least one region.
                variant :enabled,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabled }

                module Type
                  extend Anthropic::Internal::Type::Enum

                  DISABLED = :disabled
                  ENABLED = :enabled

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                # @!method self.variants
                #   @return [Array(Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabled, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabled)]

                # Creates a new instance of the variant class whose `type` matches the given
                # value, passing the remaining arguments to its constructor.
                #
                # Some parameter documentations has been truncated, see
                # {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl}
                # for more details.
                #
                # @param type [Symbol, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControl::Type, String]
                #
                # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
                #
                #   @option args [Array<Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectRetiredBucket>] :retired_buckets Buckets that a region has retired, earliest `expires_at` first.
                #
                #   @option args [Hash{Symbol=>Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageBucket}] :buckets The bucket configured for each region, keyed by region code. A region with no bu
                #
                #   @option args [Hash{Symbol=>Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionNotConfigured, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionPending, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionActive, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionFailed, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageRegionSuspended}] :status Each region's status for the control, keyed by region code. A region that your o
                #
                # @raise [ArgumentError]
                # @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabled, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabled]
                def self.new(type:, **args)
                  case type.to_sym
                  when :disabled
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabled.new(
                      **args
                    )
                  when :enabled
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabled.new(
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
