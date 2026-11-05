# typed: strong

module Anthropic
  module Models
    # The beta that the endpoint requires is not enabled for the organization. The
    # message names the beta value.
    class BetaOrganizationNotEnrolledInBetaError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::BetaOrganizationNotEnrolledInBetaErrorDetails) }
      def details
      end
    end
  end
end
