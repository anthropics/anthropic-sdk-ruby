# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Anthropic has turned off updating environments for this organization. Existing
      # environments still work as they are.
      class BetaEnvironmentUpdateDisabledError < Anthropic::Errors::PermissionDeniedError
        # @!method error_code
        #   @return [Symbol, :environment_update_disabled]

        # @return [Anthropic::Models::Beta::BetaEnvironmentUpdateDisabledErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaEnvironmentUpdateDisabledErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
