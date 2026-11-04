# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # The environment is archived, so it cannot be updated.
      class BetaEnvironmentArchivedError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :environment_archived]

        # @return [Anthropic::Models::Beta::BetaEnvironmentArchivedErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaEnvironmentArchivedErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
