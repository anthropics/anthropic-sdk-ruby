# typed: strong

module Anthropic
  module Models
    class CompactionContentMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CompactionContentMismatchErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The `compaction` block's `content` differs from the text its `signature`
      # recorded.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :compaction_content_mismatch)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
