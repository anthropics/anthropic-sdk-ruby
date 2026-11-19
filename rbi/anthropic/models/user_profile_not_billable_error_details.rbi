# typed: strong

module Anthropic
  module Models
    class UserProfileNotBillableErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileNotBillableErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request's user profile cannot be billed. The response gives no more specific
      # error code and does not say what the reason is.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :user_profile_not_billable)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
