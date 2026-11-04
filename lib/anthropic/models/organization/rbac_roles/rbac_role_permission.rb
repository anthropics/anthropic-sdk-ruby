# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      module RBACRoles
        # @see Anthropic::Resources::Organization::RBACRoles::Permissions#list
        class RBACRolePermission < Anthropic::Internal::Type::BaseModel
          # @!attribute action
          #   Action the permission grants on the resource.
          #
          #   The vocabulary follows the resource: an `organization` grant carries a
          #   product-feature entitlement (for example `chat`), an admin-panel permission
          #   entitlement (`permission_*`), or a blanket capability-access mode —
          #   `capability_access_all` grants every product-feature entitlement except
          #   `inference_hooks_inspection`, which a role holds only through its own row, and
          #   `capability_access_all_ga` grants the subset of those for stable features as it
          #   stands at permission-check time; neither mode grants model-access entitlements.
          #   A consumer enumerating a role's per-feature grants should treat a blanket row as
          #   granting every product-feature entitlement it covers, or it will under-report
          #   the role's effective access. A `connector_tool` grant carries a tool-access
          #   action (`use` or `always_allow`); a `connector_scope` grant carries the scope
          #   action `grant` (the role may receive the named OAuth scope when tokens are
          #   minted for the connector); `connector` and `all_connectors` grants carry a
          #   tool-access action, the scope action, or an authentication-method action
          #   (`interactive` or `managed`).
          #
          #   @return [String]
          required :action, String

          # @!attribute resource
          #   What the permission applies to.
          #
          #   A tagged union: `type` names the kind of resource and determines which
          #   identifier fields are present.
          #
          #   @return [Anthropic::Models::Organization::RBACRoles::RBACOrganizationPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorToolPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorScopePermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACAllConnectorsPermissionResource]
          required :resource, union: -> { Anthropic::Organization::RBACRoles::RBACRolePermission::Resource }

          # @!attribute type
          #   Object type.
          #
          #   For RBAC Role Permissions, this is always `"rbac_role_permission"`.
          #
          #   @return [Symbol, :rbac_role_permission]
          required :type, const: :rbac_role_permission

          # @!method initialize(action:, resource:, type: :rbac_role_permission)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Organization::RBACRoles::RBACRolePermission} for more
          #   details.
          #
          #   @param action [String] Action the permission grants on the resource.
          #
          #   @param resource [Anthropic::Models::Organization::RBACRoles::RBACOrganizationPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorToolPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorScopePermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACAllConnectorsPermissionResource] What the permission applies to.
          #
          #   @param type [Symbol, :rbac_role_permission] Object type.

          # What the permission applies to.
          #
          # A tagged union: `type` names the kind of resource and determines which
          # identifier fields are present.
          #
          # @see Anthropic::Models::Organization::RBACRoles::RBACRolePermission#resource
          module Resource
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :organization, -> { Anthropic::Organization::RBACRoles::RBACOrganizationPermissionResource }

            variant :connector_tool, -> { Anthropic::Organization::RBACRoles::RBACConnectorToolPermissionResource }

            variant :connector_scope, -> { Anthropic::Organization::RBACRoles::RBACConnectorScopePermissionResource }

            variant :connector, -> { Anthropic::Organization::RBACRoles::RBACConnectorPermissionResource }

            variant :all_connectors, -> { Anthropic::Organization::RBACRoles::RBACAllConnectorsPermissionResource }

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
            #   @return [Array(Anthropic::Models::Organization::RBACRoles::RBACOrganizationPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorToolPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorScopePermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACAllConnectorsPermissionResource)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Organization::RBACRoles::RBACRolePermission::Resource} for
            # more details.
            #
            # @param type [Symbol, Anthropic::Models::Organization::RBACRoles::RBACRolePermission::Resource::Type, String]
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
            # @return [Anthropic::Models::Organization::RBACRoles::RBACOrganizationPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorToolPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorScopePermissionResource, Anthropic::Models::Organization::RBACRoles::RBACConnectorPermissionResource, Anthropic::Models::Organization::RBACRoles::RBACAllConnectorsPermissionResource]
            def self.new(type:, **args)
              case type.to_sym
              when :organization
                Anthropic::Organization::RBACRoles::RBACOrganizationPermissionResource.new(**args)
              when :connector_tool
                Anthropic::Organization::RBACRoles::RBACConnectorToolPermissionResource.new(**args)
              when :connector_scope
                Anthropic::Organization::RBACRoles::RBACConnectorScopePermissionResource.new(**args)
              when :connector
                Anthropic::Organization::RBACRoles::RBACConnectorPermissionResource.new(**args)
              when :all_connectors
                Anthropic::Organization::RBACRoles::RBACAllConnectorsPermissionResource.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end
        end
      end

      RBACRolePermission = RBACRoles::RBACRolePermission
    end
  end
end
