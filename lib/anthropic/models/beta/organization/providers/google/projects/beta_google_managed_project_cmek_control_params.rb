# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Providers
          module Google
            module Projects
              # The customer-managed encryption key control. Leave it out to keep the control as
              # it is. Send `cmek`, `storage`, or both.
              module BetaGoogleManagedProjectCMEKControlParams
                extend Anthropic::Internal::Type::Union

                discriminator :type

                # Turns the control off and removes every region's key.
                variant :disabled,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams }

                # Turns the control on, or changes its keys while it is on.
                variant :enabled,
                        -> { Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams }

                module Type
                  extend Anthropic::Internal::Type::Enum

                  DISABLED = :disabled
                  ENABLED = :enabled

                  # @!method self.values
                  #   @return [Array<Symbol>]
                end

                # @!method self.variants
                #   @return [Array(Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams)]

                # Creates a new instance of the variant class whose `type` matches the given
                # value, passing the remaining arguments to its constructor.
                #
                # Some parameter documentations has been truncated, see
                # {Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControlParams}
                # for more details.
                #
                # @param type [Symbol, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKControlParams::Type, String]
                #
                # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
                #
                #   @option args [Hash{Symbol=>String, nil}] :external_key_ids The External Key to use in each region, keyed by region code, such as `us` or
                #
                # @raise [ArgumentError]
                # @return [Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams, Anthropic::Models::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams]
                def self.new(type:, **args)
                  case type.to_sym
                  when :disabled
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKDisabledParams.new(
                      **args
                    )
                  when :enabled
                    Anthropic::Beta::Organization::Providers::Google::Projects::BetaGoogleManagedProjectCMEKEnabledParams.new(
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
