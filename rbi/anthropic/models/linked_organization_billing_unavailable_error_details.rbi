# typed: strong

module Anthropic
  module Models
    class LinkedOrganizationBillingUnavailableErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::LinkedOrganizationBillingUnavailableErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # Anthropic cannot currently bill the organization linked to the request's user
      # profile, for a reason that lies with that organization's own account. The
      # response does not say what the reason is.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :linked_organization_billing_unavailable)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
