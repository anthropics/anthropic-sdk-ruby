# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module ComplianceSettingsState
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :enabled, -> { Anthropic::Organization::ComplianceSettingsStateEnabled }

        variant :disabled, -> { Anthropic::Organization::ComplianceSettingsStateDisabled }

        module Type
          extend Anthropic::Internal::Type::Enum

          ENABLED = :enabled
          DISABLED = :disabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Organization::ComplianceSettingsStateEnabled, Anthropic::Models::Organization::ComplianceSettingsStateDisabled)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, Anthropic::Models::Organization::ComplianceSettingsState::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Organization::ComplianceSettingsStateEnabled, Anthropic::Models::Organization::ComplianceSettingsStateDisabled]
        def self.new(type:, **args)
          case type.to_sym
          when :enabled
            Anthropic::Organization::ComplianceSettingsStateEnabled.new(**args)
          when :disabled
            Anthropic::Organization::ComplianceSettingsStateDisabled.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end
  end
end
