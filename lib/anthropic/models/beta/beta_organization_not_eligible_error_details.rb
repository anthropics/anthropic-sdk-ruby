# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaOrganizationNotEligibleErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :organization_not_eligible]
        required :error_code, const: :organization_not_eligible

        # @!method initialize(error_code: :organization_not_eligible)
        #   The feature isn't offered to this organization. The error's `message` names the
        #   kind of organization or, when it names none, says to contact your Anthropic
        #   account team.
        #
        #   @param error_code [Symbol, :organization_not_eligible]
      end
    end

    BetaOrganizationNotEligibleErrorDetails = Beta::BetaOrganizationNotEligibleErrorDetails
  end
end
