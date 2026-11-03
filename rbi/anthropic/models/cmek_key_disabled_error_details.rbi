# typed: strong

module Anthropic
  module Models
    class CmekKeyDisabledErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CmekKeyDisabledErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The workspace's customer-managed encryption key is disabled or revoked.
      # Re-enable the key, then retry.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :cmek_key_disabled)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
