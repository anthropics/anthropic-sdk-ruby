# frozen_string_literal: true

module Anthropic
  module Models
    # No RBAC Role with this ID was found.
    class RBACRoleNotFoundError < Anthropic::Errors::NotFoundError
      # @!method error_code
      #   @return [Symbol, :rbac_role_not_found]

      # @return [Anthropic::Models::RBACRoleNotFoundErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::RBACRoleNotFoundErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
