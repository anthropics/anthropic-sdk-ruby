# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              # The customer-owned storage control. Leave it out to keep the control as it is.
              # Send `cmek`, `storage`, or both.
              module BetaGoogleManagedProjectStorageControlParams
                extend Anthropic::Internal::Type::Union

                discriminator :type

                # Turns the control off and removes every region's bucket.
                variant :disabled,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams }

                # Turns the control on, or changes its buckets while it is on.
                variant :enabled,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams }

                module Type
                  extend Anthropic::Internal::Type::Enum

                  DISABLED = :disabled
                  ENABLED = :enabled

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                # @!method self.variants
                #   @return [Array(Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams)]

                # Creates a new instance of the variant class whose `type` matches the given
                # value, passing the remaining arguments to its constructor.
                #
                # Some parameter documentations has been truncated, see
                # {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControlParams}
                # for more details.
                #
                # @param type [Symbol, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageControlParams::Type, String]
                #
                # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
                #
                #   @option args [Hash{Symbol=>Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectBucketReference, nil}] :buckets The bucket to use in each region, keyed by region code, such as `us` or `eu`. An
                #
                # @raise [ArgumentError]
                # @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams]
                def self.new(type:, **args)
                  case type.to_sym
                  when :disabled
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageDisabledParams.new(
                      **args
                    )
                  when :enabled
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectStorageEnabledParams.new(
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
