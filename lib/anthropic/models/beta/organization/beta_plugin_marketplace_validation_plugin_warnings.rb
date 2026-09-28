# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginMarketplaceValidationPluginWarnings < Anthropic::Internal::Type::BaseModel
          # @!attribute name
          #   The plugin's name, as its entry in marketplace.json declares it.
          #
          #   @return [String]
          required :name, String

          # @!attribute warnings
          #   The parts of the plugin a synchronization would leave out.
          #
          #   @return [Array<Anthropic::Models::Beta::Organization::BetaPluginMarketplaceValidationPluginWarning>]
          required :warnings,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarning] }

          # @!method initialize(name:, warnings:)
          #   @param name [String] The plugin's name, as its entry in marketplace.json declares it.
          #
          #   @param warnings [Array<Anthropic::Models::Beta::Organization::BetaPluginMarketplaceValidationPluginWarning>] The parts of the plugin a synchronization would leave out.
        end
      end
    end
  end
end
