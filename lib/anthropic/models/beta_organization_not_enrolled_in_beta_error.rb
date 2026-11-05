# frozen_string_literal: true

module Anthropic
  module Models
    # The beta that the endpoint requires is not enabled for the organization. The
    # message names the beta value.
    class BetaOrganizationNotEnrolledInBetaError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :organization_not_enrolled_in_beta]

      # @return [Anthropic::Models::BetaOrganizationNotEnrolledInBetaErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaOrganizationNotEnrolledInBetaErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
