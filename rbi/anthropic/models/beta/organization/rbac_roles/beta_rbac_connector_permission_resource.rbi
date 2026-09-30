# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          class BetaRBACConnectorPermissionResource < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACConnectorPermissionResource,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the connector the permission applies to.
            sig { returns(String) }
            attr_accessor :connector_id

            # Kind of resource the permission applies to.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(connector_id: String, type: Symbol).returns(
                T.attached_class
              )
            end
            def self.new(
              # ID of the connector the permission applies to.
              connector_id:,
              # Kind of resource the permission applies to.
              type: :connector
            )
            end

            sig { override.returns({ connector_id: String, type: Symbol }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
