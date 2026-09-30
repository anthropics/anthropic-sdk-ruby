# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACGroups
          class BetaRBACGroupMember < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::RBACGroups::BetaRBACGroupMember,
                  Anthropic::Internal::AnyHash
                )
              end

            # RFC 3339 timestamp of when the User was added to the RBAC Group.
            sig { returns(Time) }
            attr_accessor :created_at

            # Email of the User.
            sig { returns(String) }
            attr_accessor :email

            # ID of the RBAC Group.
            sig { returns(String) }
            attr_accessor :rbac_group_id

            # Object type.
            #
            # For RBAC Group Members, this is always `"rbac_group_member"`.
            sig { returns(Symbol) }
            attr_accessor :type

            # ID of the User.
            sig { returns(String) }
            attr_accessor :user_id

            sig do
              params(
                created_at: Time,
                email: String,
                rbac_group_id: String,
                user_id: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # RFC 3339 timestamp of when the User was added to the RBAC Group.
              created_at:,
              # Email of the User.
              email:,
              # ID of the RBAC Group.
              rbac_group_id:,
              # ID of the User.
              user_id:,
              # Object type.
              #
              # For RBAC Group Members, this is always `"rbac_group_member"`.
              type: :rbac_group_member
            )
            end

            sig do
              override.returns(
                {
                  created_at: Time,
                  email: String,
                  rbac_group_id: String,
                  type: Symbol,
                  user_id: String
                }
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
