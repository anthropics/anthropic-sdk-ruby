# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginMarketplaceValidationPluginWarning < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #   A stable identifier for the kind of warning.
          #
          #   @return [String]
          required :error_code, String

          # @!attribute message
          #   What would be left out, and why.
          #
          #   @return [String]
          required :message, String

          # @!method initialize(error_code:, message:)
          #   @param error_code [String] A stable identifier for the kind of warning.
          #
          #   @param message [String] What would be left out, and why.
        end
      end
    end
  end
end
