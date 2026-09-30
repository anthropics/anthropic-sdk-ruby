# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          class BetaRBACConnectorToolPermissionResource < Anthropic::Internal::Type::BaseModel
            # @!attribute connector_id
            #   ID of the connector the permission applies to.
            #
            #   @return [String]
            required :connector_id, String

            # @!attribute tool_name
            #   Published name of the connector tool the permission applies to.
            #
            #   When the published name contains characters outside `[a-zA-Z0-9_-]` (or collides
            #   with a reserved form), it is server-encoded into a stable `{prefix}_{32-hex}`
            #   form — a shortened readable prefix of the name plus a hash — from which the
            #   published name is not recoverable.
            #
            #   @return [String]
            required :tool_name, String

            # @!attribute type
            #   Kind of resource the permission applies to.
            #
            #   @return [Symbol, :connector_tool]
            required :type, const: :connector_tool

            # @!method initialize(connector_id:, tool_name:, type: :connector_tool)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorToolPermissionResource}
            #   for more details.
            #
            #   @param connector_id [String] ID of the connector the permission applies to.
            #
            #   @param tool_name [String] Published name of the connector tool the permission applies to.
            #
            #   @param type [Symbol, :connector_tool] Kind of resource the permission applies to.
          end
        end
      end
    end
  end
end
