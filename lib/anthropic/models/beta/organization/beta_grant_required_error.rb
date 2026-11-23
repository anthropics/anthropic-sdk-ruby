# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Anthropic has not approved External Storage for the organization, for the
        # Workspace or, for storage bound to a user profile, for that user profile.
        # Contact your Anthropic account team.
        class BetaGrantRequiredError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :grant_required]

          # @return [Anthropic::Models::Beta::Organization::BetaGrantRequiredErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaGrantRequiredErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
