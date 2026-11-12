# typed: strong

module Anthropic
  module Models
    module Organization
      class RBACRoleSourceCustom < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::RBACRoleSourceCustom,
              Anthropic::Internal::AnyHash
            )
          end

        # The organization's administrators can change and delete the RBAC Role.
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(
          # The organization's administrators can change and delete the RBAC Role.
          type: :custom
        )
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
