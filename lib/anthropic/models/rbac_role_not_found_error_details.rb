# frozen_string_literal: true

module Anthropic
  module Models
    class RBACRoleNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :rbac_role_not_found]
      required :error_code, const: :rbac_role_not_found

      # @!method initialize(error_code: :rbac_role_not_found)
      #   No RBAC Role with this ID was found.
      #
      #   @param error_code [Symbol, :rbac_role_not_found]
    end
  end
end
