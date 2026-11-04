# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # `settings.environment_id` names no Environment within the organization's reach.
      class BetaEnvironmentNotFoundError < Anthropic::Errors::NotFoundError
        # @!method error_code
        #   @return [Symbol, :environment_not_found]

        # @return [Anthropic::Models::Beta::BetaEnvironmentNotFoundErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaEnvironmentNotFoundErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
