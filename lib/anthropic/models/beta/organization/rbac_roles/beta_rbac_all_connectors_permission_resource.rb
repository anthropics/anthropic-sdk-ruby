# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          class BetaRBACAllConnectorsPermissionResource < Anthropic::Internal::Type::BaseModel
            # @!attribute type
            #   Kind of resource the permission applies to.
            #
            #   @return [Symbol, :all_connectors]
            required :type, const: :all_connectors

            # @!method initialize(type: :all_connectors)
            #   @param type [Symbol, :all_connectors] Kind of resource the permission applies to.
          end
        end
      end
    end
  end
end
