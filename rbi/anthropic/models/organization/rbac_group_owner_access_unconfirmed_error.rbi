# typed: strong

module Anthropic
  module Models
    module Organization
      # The API could not finish checking whether an RBAC Group in the request grants
      # owner access, so it made no change. Retrying the same request will not help.
      # Make the change in the organization's admin settings in Claude.
      class RBACGroupOwnerAccessUnconfirmedError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Organization::RBACGroupOwnerAccessUnconfirmedErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end
