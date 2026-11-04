# typed: strong

module Anthropic
  module Models
    module Organization
      # A role attached to an RBAC Group in the request grants owner access, so this API
      # does not add members to that group (directly or through an invite), remove its
      # members, or delete it. Make the change in the organization's admin settings in
      # Claude.
      class RBACGroupGrantsOwnerAccessError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Organization::RBACGroupGrantsOwnerAccessErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end
