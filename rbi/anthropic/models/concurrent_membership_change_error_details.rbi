# typed: strong

module Anthropic
  module Models
    class ConcurrentMembershipChangeErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ConcurrentMembershipChangeErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # Another change to the organization's members is in progress. Retry the request
      # once it completes.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :concurrent_membership_change)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
