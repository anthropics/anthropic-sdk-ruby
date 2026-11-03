# typed: strong

module Anthropic
  module Models
    class CmekKeyUnreachableErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CmekKeyUnreachableErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The workspace's customer-managed encryption key could not be reached. Retry the
      # request; if this continues, check that the key is available in your key
      # management service, or contact Anthropic support.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :cmek_key_unreachable)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
