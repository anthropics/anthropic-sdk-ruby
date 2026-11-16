# typed: strong

module Anthropic
  module Models
    # No RBAC Role with this ID was found.
    class RBACRoleNotFoundError < Anthropic::Errors::NotFoundError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::RBACRoleNotFoundErrorDetails) }
      def details
      end
    end
  end
end
