# typed: strong

module Anthropic
  module Models
    class CMEKKeyNetworkBlockedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CMEKKeyNetworkBlockedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The key management service's network access controls blocked the request to the
      # workspace's customer-managed encryption key. The key itself may be healthy.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :cmek_key_network_blocked)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
