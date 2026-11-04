# typed: strong

module Anthropic
  module Models
    module Organization
      # The organization has reached its limit of active API keys.
      class OrgAPIKeyLimitExceededError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Organization::OrgAPIKeyLimitExceededErrorDetails)
        end
        def details
        end
      end
    end
  end
end
