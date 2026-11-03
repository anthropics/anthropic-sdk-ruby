# frozen_string_literal: true

module Anthropic
  module Models
    class RBACGroupGrantsOwnerAccessErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :rbac_group_grants_owner_access]
      required :error_code, const: :rbac_group_grants_owner_access

      # @!method initialize(error_code: :rbac_group_grants_owner_access)
      #   A role attached to an RBAC Group in the request grants owner access, so this API
      #   does not add members to that group (directly or through an invite), remove its
      #   members, or delete it. Make the change in the organization's admin settings in
      #   Claude.
      #
      #   @param error_code [Symbol, :rbac_group_grants_owner_access]
    end
  end
end
