# typed: strong

module Anthropic
  module Models
    class RBACRoleNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::RBACRoleNotFoundErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # No RBAC Role with this ID was found.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :rbac_role_not_found)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
