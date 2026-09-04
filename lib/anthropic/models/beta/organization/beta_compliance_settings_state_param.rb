# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaComplianceSettingsStateParam
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :enabled, -> { Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabledParam }

          variant :disabled, -> { Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabledParam }

          module Type
            extend Anthropic::Internal::Type::Enum

            ENABLED = :enabled
            DISABLED = :disabled

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabledParam, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabledParam)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabledParam, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabledParam]
          def self.new(type:, **args)
            case type.to_sym
            when :enabled
              Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabledParam.new(**args)
            when :disabled
              Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabledParam.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
