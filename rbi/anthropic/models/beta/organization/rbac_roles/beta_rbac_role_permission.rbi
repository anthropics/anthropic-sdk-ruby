# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          class BetaRBACRolePermission < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission,
                  Anthropic::Internal::AnyHash
                )
              end

            # Action the permission grants on the resource.
            #
            # The vocabulary follows the resource: an `organization` grant carries a
            # product-feature entitlement (for example `chat`), an admin-panel permission
            # entitlement (`permission_*`), or a blanket capability-access mode —
            # `capability_access_all` grants every product-feature entitlement, and
            # `capability_access_all_ga` grants the generally-available subset as it stands at
            # permission-check time; neither mode grants model-access entitlements. A consumer
            # enumerating a role's per-feature grants should treat a blanket row as granting
            # every product-feature entitlement it covers, or it will under-report the role's
            # effective access. A `connector_tool` grant carries a tool-access action (`use`
            # or `always_allow`); a `connector_scope` grant carries the scope action `grant`
            # (the role may receive the named OAuth scope when tokens are minted for the
            # connector); `connector` and `all_connectors` grants carry a tool-access action,
            # the scope action, or an authentication-method action (`interactive` or
            # `managed`).
            sig { returns(String) }
            attr_accessor :action

            # What the permission applies to.
            #
            # A tagged union: `type` names the kind of resource and determines which
            # identifier fields are present.
            sig do
              returns(
                Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Variants
              )
            end
            attr_accessor :resource

            # Object type.
            #
            # For RBAC Role Permissions, this is always `"rbac_role_permission"`.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(
                action: String,
                resource:
                  T.any(
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACOrganizationPermissionResource::OrHash,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorToolPermissionResource::OrHash,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorScopePermissionResource::OrHash,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorPermissionResource::OrHash,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACAllConnectorsPermissionResource::OrHash
                  ),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Action the permission grants on the resource.
              #
              # The vocabulary follows the resource: an `organization` grant carries a
              # product-feature entitlement (for example `chat`), an admin-panel permission
              # entitlement (`permission_*`), or a blanket capability-access mode —
              # `capability_access_all` grants every product-feature entitlement, and
              # `capability_access_all_ga` grants the generally-available subset as it stands at
              # permission-check time; neither mode grants model-access entitlements. A consumer
              # enumerating a role's per-feature grants should treat a blanket row as granting
              # every product-feature entitlement it covers, or it will under-report the role's
              # effective access. A `connector_tool` grant carries a tool-access action (`use`
              # or `always_allow`); a `connector_scope` grant carries the scope action `grant`
              # (the role may receive the named OAuth scope when tokens are minted for the
              # connector); `connector` and `all_connectors` grants carry a tool-access action,
              # the scope action, or an authentication-method action (`interactive` or
              # `managed`).
              action:,
              # What the permission applies to.
              #
              # A tagged union: `type` names the kind of resource and determines which
              # identifier fields are present.
              resource:,
              # Object type.
              #
              # For RBAC Role Permissions, this is always `"rbac_role_permission"`.
              type: :rbac_role_permission
            )
            end

            sig do
              override.returns(
                {
                  action: String,
                  resource:
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Variants,
                  type: Symbol
                }
              )
            end
            def to_hash
            end

            # What the permission applies to.
            #
            # A tagged union: `type` names the kind of resource and determines which
            # identifier fields are present.
            module Resource
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACOrganizationPermissionResource,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorToolPermissionResource,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorScopePermissionResource,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorPermissionResource,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACAllConnectorsPermissionResource
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ORGANIZATION =
                  T.let(
                    :organization,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Type::TaggedSymbol
                  )
                CONNECTOR_TOOL =
                  T.let(
                    :connector_tool,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Type::TaggedSymbol
                  )
                CONNECTOR_SCOPE =
                  T.let(
                    :connector_scope,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Type::TaggedSymbol
                  )
                CONNECTOR =
                  T.let(
                    :connector,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Type::TaggedSymbol
                  )
                ALL_CONNECTORS =
                  T.let(
                    :all_connectors,
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Variants
                  ]
                )
              end
              def self.variants
              end

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              sig do
                params(
                  type:
                    Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Type::OrSymbol,
                  organization_id: String,
                  connector_id: String,
                  tool_name: String,
                  scope: String
                ).returns(
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Variants
                )
              end
              def self.new(
                type:,
                # UUID of the organization the permission applies to.
                organization_id: nil,
                # ID of the connector the permission applies to.
                connector_id: nil,
                # Published name of the connector tool the permission applies to.
                #
                # When the published name contains characters outside `[a-zA-Z0-9_-]` (or collides
                # with a reserved form), it is server-encoded into a stable `{prefix}_{32-hex}`
                # form — a shortened readable prefix of the name plus a hash — from which the
                # published name is not recoverable.
                tool_name: nil,
                # OAuth scope the permission names — the role may receive this scope when tokens
                # are minted for the connector.
                #
                # Subject to the same encoding rule as `tool_name`: a scope containing characters
                # outside `[a-zA-Z0-9_-]` (or colliding with a reserved form) appears
                # server-encoded in a stable `{prefix}_{32-hex}` form. OAuth scopes routinely
                # contain `:` and `/`, so most appear encoded.
                scope: nil
              )
              end
            end
          end
        end
      end
    end
  end
end
