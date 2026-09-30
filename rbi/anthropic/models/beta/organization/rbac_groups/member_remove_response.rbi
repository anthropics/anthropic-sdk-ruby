# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACGroups
          class MemberRemoveResponse < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Models::Beta::Organization::RBACGroups::MemberRemoveResponse,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the RBAC Group.
            sig { returns(String) }
            attr_accessor :rbac_group_id

            # Deleted object type. For RBAC Group Members, this is always
            # `"rbac_group_member_deleted"`.
            sig { returns(Symbol) }
            attr_accessor :type

            # ID of the User.
            sig { returns(String) }
            attr_accessor :user_id

            sig do
              params(
                rbac_group_id: String,
                user_id: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the RBAC Group.
              rbac_group_id:,
              # ID of the User.
              user_id:,
              # Deleted object type. For RBAC Group Members, this is always
              # `"rbac_group_member_deleted"`.
              type: :rbac_group_member_deleted
            )
            end

            sig do
              override.returns(
                { rbac_group_id: String, type: Symbol, user_id: String }
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
