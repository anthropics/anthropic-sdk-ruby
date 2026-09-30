# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          class BetaRBACConnectorScopePermissionResource < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorScopePermissionResource,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the connector the permission applies to.
            sig { returns(String) }
            attr_accessor :connector_id

            # OAuth scope the permission names — the role may receive this scope when tokens
            # are minted for the connector.
            #
            # Subject to the same encoding rule as `tool_name`: a scope containing characters
            # outside `[a-zA-Z0-9_-]` (or colliding with a reserved form) appears
            # server-encoded in a stable `{prefix}_{32-hex}` form. OAuth scopes routinely
            # contain `:` and `/`, so most appear encoded.
            sig { returns(String) }
            attr_accessor :scope

            # Kind of resource the permission applies to.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(connector_id: String, scope: String, type: Symbol).returns(
                T.attached_class
              )
            end
            def self.new(
              # ID of the connector the permission applies to.
              connector_id:,
              # OAuth scope the permission names — the role may receive this scope when tokens
              # are minted for the connector.
              #
              # Subject to the same encoding rule as `tool_name`: a scope containing characters
              # outside `[a-zA-Z0-9_-]` (or colliding with a reserved form) appears
              # server-encoded in a stable `{prefix}_{32-hex}` form. OAuth scopes routinely
              # contain `:` and `/`, so most appear encoded.
              scope:,
              # Kind of resource the permission applies to.
              type: :connector_scope
            )
            end

            sig do
              override.returns(
                { connector_id: String, scope: String, type: Symbol }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
