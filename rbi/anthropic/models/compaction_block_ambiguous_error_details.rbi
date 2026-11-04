# typed: strong

module Anthropic
  module Models
    class CompactionBlockAmbiguousErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CompactionBlockAmbiguousErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # `messages` holds more than one `compaction` block with content. Send only the
      # block the conversation returned last.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :compaction_block_ambiguous)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
