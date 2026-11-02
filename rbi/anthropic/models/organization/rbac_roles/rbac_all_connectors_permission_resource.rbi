# typed: strong

module Anthropic
  module Models
    module Organization
      module RBACRoles
        class RBACAllConnectorsPermissionResource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::RBACRoles::RBACAllConnectorsPermissionResource,
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
