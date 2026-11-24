# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module UserProfiles
        module Providers
          module Google
            # How to set the `cmek` control, discriminated by `type`.
            module BetaGoogleManagedCMEKControlParams
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # Turns the control off and removes every region's key.
              variant :disabled,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams }

              # Turns the control on, or changes its keys while it is on.
              variant :enabled,
                      -> { Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams }

              module Type
                extend Anthropic::Internal::Type::Enum

                DISABLED = :disabled
                ENABLED = :enabled

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControlParams}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKControlParams::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [Hash{Symbol=>String, nil}, nil] :external_key_ids The External Key to use in each region, keyed by region code, such as `us` or
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams, Anthropic::Models::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams]
              def self.new(type:, **args)
                case type.to_sym
                when :disabled
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKDisabledParams.new(**args)
                when :enabled
                  Anthropic::Beta::UserProfiles::Providers::Google::BetaGoogleManagedCMEKEnabledParams.new(**args)
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
