# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Anthropic has turned off creating environments for this organization. Existing
      # environments still work.
      class BetaEnvironmentCreateDisabledError < Anthropic::Errors::PermissionDeniedError
        # @!method error_code
        #   @return [Symbol, :environment_create_disabled]

        # @return [Anthropic::Models::Beta::BetaEnvironmentCreateDisabledErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaEnvironmentCreateDisabledErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
