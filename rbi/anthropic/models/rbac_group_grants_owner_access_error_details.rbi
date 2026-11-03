# typed: strong

module Anthropic
  module Models
    class RBACGroupGrantsOwnerAccessErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::RBACGroupGrantsOwnerAccessErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # A role attached to an RBAC Group in the request grants owner access, so this API
      # does not add members to that group (directly or through an invite), remove its
      # members, or delete it. Make the change in the organization's admin settings in
      # Claude.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :rbac_group_grants_owner_access)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
