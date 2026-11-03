# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class RBACGroupOwnerAccessUnconfirmedErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :rbac_group_owner_access_unconfirmed]
        required :error_code, const: :rbac_group_owner_access_unconfirmed

        # @!method initialize(error_code: :rbac_group_owner_access_unconfirmed)
        #   The API could not finish checking whether an RBAC Group in the request grants
        #   owner access (the check reached a fixed limit), so it made no change. Retrying
        #   the same request will not help. Make the change in the organization's admin
        #   settings in Claude.
        #
        #   @param error_code [Symbol, :rbac_group_owner_access_unconfirmed]
      end
    end
  end
end
