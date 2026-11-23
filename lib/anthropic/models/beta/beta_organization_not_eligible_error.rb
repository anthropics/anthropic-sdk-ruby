# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # The feature isn't offered to this organization. The error's `message` names the
      # kind of organization or, when it names none, says to contact your Anthropic
      # account team.
      class BetaOrganizationNotEligibleError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :organization_not_eligible]

        # @return [Anthropic::Models::Beta::BetaOrganizationNotEligibleErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaOrganizationNotEligibleErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
