# typed: strong

module Anthropic
  module Models
    class LinkedOrganizationSpendLimitReachedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::LinkedOrganizationSpendLimitReachedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The organization linked to the request's user profile has reached a spend limit
      # that it set, or lacks credit for the request. The response does not say which
      # applies.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :linked_organization_spend_limit_reached)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
