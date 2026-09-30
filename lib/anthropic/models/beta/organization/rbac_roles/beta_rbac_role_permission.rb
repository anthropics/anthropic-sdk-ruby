# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          # @see Anthropic::Resources::Beta::Organization::RBACRoles::Permissions#list
          class BetaRBACRolePermission < Anthropic::Internal::Type::BaseModel
            # @!attribute action
            #   Action the permission grants on the resource.
            #
            #   The vocabulary follows the resource: an `organization` grant carries a
            #   product-feature entitlement (for example `chat`), an admin-panel permission
            #   entitlement (`permission_*`), or a blanket capability-access mode —
            #   `capability_access_all` grants every product-feature entitlement, and
            #   `capability_access_all_ga` grants the generally-available subset as it stands at
            #   permission-check time; neither mode grants model-access entitlements. A consumer
            #   enumerating a role's per-feature grants should treat a blanket row as granting
            #   every product-feature entitlement it covers, or it will under-report the role's
            #   effective access. A `connector_tool` grant carries a tool-access action (`use`
            #   or `always_allow`); a `connector_scope` grant carries the scope action `grant`
            #   (the role may receive the named OAuth scope when tokens are minted for the
            #   connector); `connector` and `all_connectors` grants carry a tool-access action,
            #   the scope action, or an authentication-method action (`interactive` or
            #   `managed`).
            #
            #   @return [String]
            required :action, String

            # @!attribute resource
            #   What the permission applies to.
            #
            #   A tagged union: `type` names the kind of resource and determines which
            #   identifier fields are present.
            #
            #   @return [Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACOrganizationPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorToolPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorScopePermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACAllConnectorsPermissionResource]
            required :resource,
                     union: -> { Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource }

            # @!attribute type
            #   Object type.
            #
            #   For RBAC Role Permissions, this is always `"rbac_role_permission"`.
            #
            #   @return [Symbol, :rbac_role_permission]
            required :type, const: :rbac_role_permission

            # @!method initialize(action:, resource:, type: :rbac_role_permission)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACRolePermission} for
            #   more details.
            #
            #   @param action [String] Action the permission grants on the resource.
            #
            #   @param resource [Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACOrganizationPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorToolPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorScopePermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACAllConnectorsPermissionResource] What the permission applies to.
            #
            #   @param type [Symbol, :rbac_role_permission] Object type.

            # What the permission applies to.
            #
            # A tagged union: `type` names the kind of resource and determines which
            # identifier fields are present.
            #
            # @see Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACRolePermission#resource
            module Resource
              extend Anthropic::Internal::Type::Union

              discriminator :type

              variant :organization,
                      -> { Anthropic::Beta::Organization::RBACRoles::BetaRBACOrganizationPermissionResource }

              variant :connector_tool,
                      -> { Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorToolPermissionResource }

              variant :connector_scope,
                      -> { Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorScopePermissionResource }

              variant :connector, -> { Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorPermissionResource }

              variant :all_connectors,
                      -> { Anthropic::Beta::Organization::RBACRoles::BetaRBACAllConnectorsPermissionResource }

              module Type
                extend Anthropic::Internal::Type::Enum

                ORGANIZATION = :organization
                CONNECTOR_TOOL = :connector_tool
                CONNECTOR_SCOPE = :connector_scope
                CONNECTOR = :connector
                ALL_CONNECTORS = :all_connectors

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACOrganizationPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorToolPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorScopePermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACAllConnectorsPermissionResource)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACRolePermission::Resource::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [String] :organization_id UUID of the organization the permission applies to.
              #
              #   @option args [String] :connector_id ID of the connector the permission applies to.
              #
              #   @option args [String] :tool_name Published name of the connector tool the permission applies to.
              #
              #   @option args [String] :scope OAuth scope the permission names — the role may receive this scope when
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACOrganizationPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorToolPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorScopePermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACConnectorPermissionResource, Anthropic::Models::Beta::Organization::RBACRoles::BetaRBACAllConnectorsPermissionResource]
              def self.new(type:, **args)
                case type.to_sym
                when :organization
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACOrganizationPermissionResource.new(**args)
                when :connector_tool
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorToolPermissionResource.new(**args)
                when :connector_scope
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorScopePermissionResource.new(**args)
                when :connector
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorPermissionResource.new(**args)
                when :all_connectors
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACAllConnectorsPermissionResource.new(**args)
                else
                  raise ArgumentError, "unknown type: #{type}"
                end
              end
            end
          end
        end
      end
    end
  end
end
