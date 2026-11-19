# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          # The RBAC Group order already has the most groups allowed. Delete another group's
          # settings first.
          class BetaRBACGroupOrderLimitExceededError < Anthropic::Errors::BadRequestError
            sig { returns(Symbol) }
            def error_code
            end

            sig do
              returns(
                Anthropic::Beta::Organization::ClaudeCode::BetaRBACGroupOrderLimitExceededErrorDetails
              )
            end
            def details
            end
          end
        end
      end
    end
  end
end
