# typed: strong

module Anthropic
  module Models
    class RBACGroupOwnerAccessUnconfirmedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::RBACGroupOwnerAccessUnconfirmedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The API could not finish checking whether an RBAC Group in the request grants
      # owner access (the check reached a fixed limit), so it made no change. Retrying
      # the same request will not help. Make the change in the organization's admin
      # settings in Claude.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :rbac_group_owner_access_unconfirmed)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
