# typed: strong

module Anthropic
  module Models
    module Organization
      class RBACRole < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::RBACRole,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the RBAC Role.
        sig { returns(String) }
        attr_accessor :id

        # RFC 3339 datetime string indicating when the RBAC Role was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # Name of the RBAC Role. For a role created by Anthropic, this is Anthropic's name
        # for the access that the role grants. Anthropic may change this name, so to keep
        # a lasting reference to a role, store its `id`.
        sig { returns(String) }
        attr_accessor :display_name

        # Object type.
        #
        # For RBAC Roles, this is always `"rbac_role"`.
        sig { returns(Symbol) }
        attr_accessor :type

        # RFC 3339 datetime string indicating when the RBAC Role was last updated.
        sig { returns(Time) }
        attr_accessor :updated_at

        sig do
          params(
            id: String,
            created_at: Time,
            display_name: String,
            updated_at: Time,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the RBAC Role.
          id:,
          # RFC 3339 datetime string indicating when the RBAC Role was created.
          created_at:,
          # Name of the RBAC Role. For a role created by Anthropic, this is Anthropic's name
          # for the access that the role grants. Anthropic may change this name, so to keep
          # a lasting reference to a role, store its `id`.
          display_name:,
          # RFC 3339 datetime string indicating when the RBAC Role was last updated.
          updated_at:,
          # Object type.
          #
          # For RBAC Roles, this is always `"rbac_role"`.
          type: :rbac_role
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              display_name: String,
              type: Symbol,
              updated_at: Time
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
