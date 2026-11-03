# typed: strong

module Anthropic
  module Models
    class OrganizationOnHoldErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::OrganizationOnHoldErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      sig { returns(T.nilable(String)) }
      attr_accessor :appeal_url

      # Anthropic has disabled the organization for trust and safety reasons. An
      # organization disabled for any other reason, such as billing, does not get this
      # code. `appeal_url`, when present, is where the organization can appeal.
      sig do
        params(appeal_url: T.nilable(String), error_code: Symbol).returns(
          T.attached_class
        )
      end
      def self.new(appeal_url: nil, error_code: :organization_on_hold)
      end

      sig do
        override.returns({ error_code: Symbol, appeal_url: T.nilable(String) })
      end
      def to_hash
      end
    end
  end
end
