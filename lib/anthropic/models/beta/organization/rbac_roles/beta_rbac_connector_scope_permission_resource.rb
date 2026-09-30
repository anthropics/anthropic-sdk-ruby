# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          class BetaRBACConnectorScopePermissionResource < Anthropic::Internal::Type::BaseModel
            # @!attribute connector_id
            #   ID of the connector the permission applies to.
            #
            #   @return [String]
            required :connector_id, String

            # @!attribute scope
            #   OAuth scope the permission names — the role may receive this scope when tokens
            #   are minted for the connector.
            #
            #   Subject to the same encoding rule as `tool_name`: a scope containing characters
            #   outside `[a-zA-Z0-9_-]` (or colliding with a reserved form) appears
            #   server-encoded in a stable `{prefix}_{32-hex}` form. OAuth scopes routinely
            #   contain `:` and `/`, so most appear encoded.
            #
            #   @return [String]
            required :scope, String

            # @!attribute type
            #   Kind of resource the permission applies to.
            #
            #   @return [Symbol, :connector_scope]
            required :type, const: :connector_scope

            # @!method initialize(connector_id:, scope:, type: :connector_scope)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorScopePermissionResource}
            #   for more details.
            #
            #   @param connector_id [String] ID of the connector the permission applies to.
            #
            #   @param scope [String] OAuth scope the permission names — the role may receive this scope when
            #
            #   @param type [Symbol, :connector_scope] Kind of resource the permission applies to.
          end
        end
      end
    end
  end
end
