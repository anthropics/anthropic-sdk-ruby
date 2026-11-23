# typed: strong

module Anthropic
  module Models
    module Beta
      # Turning human review off needs Anthropic's approval for the organization, and
      # the organization doesn't have it. Contact Anthropic support to request approval.
      class BetaApprovalRequiredError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig { returns(Anthropic::Beta::BetaApprovalRequiredErrorDetails) }
        def details
        end
      end
    end
  end
end
