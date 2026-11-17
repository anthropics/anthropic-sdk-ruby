# typed: strong

module Anthropic
  module Models
    class UserProfileBillingNotAuthorizedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileBillingNotAuthorizedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The customer that the named user profile represents has not authorized the
      # caller to bill them, or the authorization that the request's credential uses has
      # ended. The response does not say which applies.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :user_profile_billing_not_authorized)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
