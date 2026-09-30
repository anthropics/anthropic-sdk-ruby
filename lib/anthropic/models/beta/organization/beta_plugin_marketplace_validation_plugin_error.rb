# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginMarketplaceValidationPluginError < Anthropic::Internal::Type::BaseModel
          # @!attribute error
          #   Why the plugin would be skipped by a synchronization.
          #
          #   @return [String]
          required :error, String

          # @!attribute error_code
          #   A stable identifier for the reason — the value to branch on.
          #
          #   @return [String]
          required :error_code, String

          # @!attribute name
          #   The plugin's name, as its entry in marketplace.json declares it.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(error:, error_code:, name:)
          #   @param error [String] Why the plugin would be skipped by a synchronization.
          #
          #   @param error_code [String] A stable identifier for the reason — the value to branch on.
          #
          #   @param name [String] The plugin's name, as its entry in marketplace.json declares it.
        end
      end
    end
  end
end
