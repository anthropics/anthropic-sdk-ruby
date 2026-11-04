# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The API could not finish checking whether an RBAC Group in the request grants
      # owner access, so it made no change. Retrying the same request will not help.
      # Make the change in the organization's admin settings in Claude.
      class RBACGroupOwnerAccessUnconfirmedError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :rbac_group_owner_access_unconfirmed]

        # @return [Anthropic::Models::Organization::RBACGroupOwnerAccessUnconfirmedErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::RBACGroupOwnerAccessUnconfirmedErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
