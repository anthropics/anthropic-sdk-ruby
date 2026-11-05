# frozen_string_literal: true

module Anthropic
  module Models
    class BetaOrganizationNotEnrolledInBetaErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :organization_not_enrolled_in_beta]
      required :error_code, const: :organization_not_enrolled_in_beta

      # @!method initialize(error_code: :organization_not_enrolled_in_beta)
      #   The beta that the endpoint requires is not enabled for the organization. The
      #   message names the beta value.
      #
      #   @param error_code [Symbol, :organization_not_enrolled_in_beta]
    end
  end
end
