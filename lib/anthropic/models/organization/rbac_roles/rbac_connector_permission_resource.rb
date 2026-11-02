# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module RBACRoles
        class RBACConnectorPermissionResource < Anthropic::Internal::Type::BaseModel
          # @!attribute connector_id
          #   ID of the connector the permission applies to.
          #
          #   @return [String]
          required :connector_id, String

          # @!attribute type
          #   Kind of resource the permission applies to.
          #
          #   @return [Symbol, :connector]
          required :type, const: :connector

          # @!method initialize(connector_id:, type: :connector)
          #   @param connector_id [String] ID of the connector the permission applies to.
          #
          #   @param type [Symbol, :connector] Kind of resource the permission applies to.
        end
      end
    end
  end
end
