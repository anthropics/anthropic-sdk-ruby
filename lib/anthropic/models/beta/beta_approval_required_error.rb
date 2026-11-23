# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Turning human review off needs Anthropic's approval for the organization, and
      # the organization doesn't have it. Contact Anthropic support to request approval.
      class BetaApprovalRequiredError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :approval_required]

        # @return [Anthropic::Models::Beta::BetaApprovalRequiredErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaApprovalRequiredErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
