# typed: strong

module Anthropic
  module Models
    class BetaStorageInUseErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BetaStorageInUseErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The bucket is already in use, or was in use recently. Name a different bucket.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :storage_in_use)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
