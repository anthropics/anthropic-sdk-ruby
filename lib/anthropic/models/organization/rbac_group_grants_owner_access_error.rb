# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # A role attached to an RBAC Group in the request grants owner access, so this API
      # does not add members to that group (directly or through an invite), remove its
      # members, or delete it. Make the change in the organization's admin settings in
      # Claude.
      class RBACGroupGrantsOwnerAccessError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :rbac_group_grants_owner_access]

        # @return [Anthropic::Models::Organization::RBACGroupGrantsOwnerAccessErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::RBACGroupGrantsOwnerAccessErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
