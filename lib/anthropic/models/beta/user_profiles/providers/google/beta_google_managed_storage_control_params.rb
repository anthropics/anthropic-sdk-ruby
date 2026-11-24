# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # How to set the `storage` control, discriminated by `type`.
            module BetaGoogleManagedStorageControlParams
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # Turns the control off and removes every region's bucket.
              variant :disabled,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams }

              # Turns the control on, or changes its buckets while it is on.
              variant :enabled,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams }

              module Type
                extend Anthropic::Internal::Type::Enum

                DISABLED = :disabled
                ENABLED = :enabled

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControlParams}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageControlParams::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [Hash{Symbol=>Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedBucketReference, nil}] :buckets The bucket to use in each region, keyed by region code, such as `us` or `eu`. An
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams]
              def self.new(type:, **args)
                case type.to_sym
                when :disabled
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageDisabledParams.new(**args)
                when :enabled
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedStorageEnabledParams.new(**args)
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
