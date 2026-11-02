# typed: strong

module Anthropic
  module Models
    module Organization
      class DeletedRBACGroup < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::DeletedRBACGroup,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the RBAC Group.
        sig { returns(String) }
        attr_accessor :id

        # Deleted object type.
        #
        # For RBAC Groups, this is always `"rbac_group_deleted"`.
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # ID of the RBAC Group.
          id:,
          # Deleted object type.
          #
          # For RBAC Groups, this is always `"rbac_group_deleted"`.
          type: :rbac_group_deleted
        )
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
