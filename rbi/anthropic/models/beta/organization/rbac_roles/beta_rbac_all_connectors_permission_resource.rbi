# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          class BetaRBACAllConnectorsPermissionResource < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACAllConnectorsPermissionResource,
                  Anthropic::Internal::AnyHash
                )
              end

            # Kind of resource the permission applies to.
            sig { returns(Symbol) }
            attr_accessor :type

            sig { params(type: Symbol).returns(T.attached_class) }
            def self.new(
              # Kind of resource the permission applies to.
              type: :all_connectors
            )
            end

            sig { override.returns({ type: Symbol }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
