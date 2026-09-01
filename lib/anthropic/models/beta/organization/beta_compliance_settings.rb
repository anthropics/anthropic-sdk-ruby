# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ComplianceSettings#retrieve
        class BetaComplianceSettings < Anthropic::Internal::Type::BaseModel
          # @!attribute state
          #   Whether the Compliance API is enabled for this organization.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabled, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabled]
          required :state, union: -> { Anthropic::Beta::Organization::BetaComplianceSettings::State }

          # @!attribute type
          #
          #   @return [Symbol, :compliance_settings]
          required :type, const: :compliance_settings

          # @!method initialize(state:, type: :compliance_settings)
          #   @param state [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabled, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabled] Whether the Compliance API is enabled for this organization.
          #
          #   @param type [Symbol, :compliance_settings]

          # Whether the Compliance API is enabled for this organization.
          #
          # @see Anthropic::Models::Beta::Organization::BetaComplianceSettings#state
          module State
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :enabled, -> { Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabled }

            variant :disabled, -> { Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabled }

            module Type
              extend Anthropic::Internal::Type::Enum

              ENABLED = :enabled
              DISABLED = :disabled

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabled, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabled)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabled, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabled]
            def self.new(type:, **args)
              case type.to_sym
              when :enabled
                Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabled.new(**args)
              when :disabled
                Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabled.new(**args)
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
