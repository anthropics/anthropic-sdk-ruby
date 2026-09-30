# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          class BetaRBACOrganizationPermissionResource < Anthropic::Internal::Type::BaseModel
            # @!attribute organization_id
            #   UUID of the organization the permission applies to.
            #
            #   @return [String]
            required :organization_id, String

            # @!attribute type
            #   Kind of resource the permission applies to.
            #
            #   @return [Symbol, :organization]
            required :type, const: :organization

            # @!method initialize(organization_id:, type: :organization)
            #   @param organization_id [String] UUID of the organization the permission applies to.
            #
            #   @param type [Symbol, :organization] Kind of resource the permission applies to.
          end
        end
      end
    end
  end
end
