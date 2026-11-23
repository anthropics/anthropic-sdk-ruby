# typed: strong

module Anthropic
  module Models
    module Beta
      # The feature isn't offered to this organization. The error's `message` names the
      # kind of organization or, when it names none, says to contact your Anthropic
      # account team.
      class BetaOrganizationNotEligibleError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Beta::BetaOrganizationNotEligibleErrorDetails)
        end
        def details
        end
      end
    end
  end
end
