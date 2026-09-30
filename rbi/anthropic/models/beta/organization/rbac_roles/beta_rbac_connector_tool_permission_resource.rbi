# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          class BetaRBACConnectorToolPermissionResource < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorToolPermissionResource,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the connector the permission applies to.
            sig { returns(String) }
            attr_accessor :connector_id

            # Published name of the connector tool the permission applies to.
            #
            # When the published name contains characters outside `[a-zA-Z0-9_-]` (or collides
            # with a reserved form), it is server-encoded into a stable `{prefix}_{32-hex}`
            # form — a shortened readable prefix of the name plus a hash — from which the
            # published name is not recoverable.
            sig { returns(String) }
            attr_accessor :tool_name

            # Kind of resource the permission applies to.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(
                connector_id: String,
                tool_name: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the connector the permission applies to.
              connector_id:,
              # Published name of the connector tool the permission applies to.
              #
              # When the published name contains characters outside `[a-zA-Z0-9_-]` (or collides
              # with a reserved form), it is server-encoded into a stable `{prefix}_{32-hex}`
              # form — a shortened readable prefix of the name plus a hash — from which the
              # published name is not recoverable.
              tool_name:,
              # Kind of resource the permission applies to.
              type: :connector_tool
            )
            end

            sig do
              override.returns(
                { connector_id: String, tool_name: String, type: Symbol }
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
