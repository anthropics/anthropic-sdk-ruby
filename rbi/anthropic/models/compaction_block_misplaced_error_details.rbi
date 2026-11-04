# typed: strong

module Anthropic
  module Models
    class CompactionBlockMisplacedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CompactionBlockMisplacedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The `compaction` block is not the first block of the conversation, or is in a
      # `system` message.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :compaction_block_misplaced)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
