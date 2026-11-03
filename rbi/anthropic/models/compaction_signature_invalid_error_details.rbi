# typed: strong

module Anthropic
  module Models
    class CompactionSignatureInvalidErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CompactionSignatureInvalidErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The `compaction` block's `signature` does not verify.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :compaction_signature_invalid)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
