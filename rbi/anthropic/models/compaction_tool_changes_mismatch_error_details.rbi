# typed: strong

module Anthropic
  module Models
    class CompactionToolChangesMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CompactionToolChangesMismatchErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The `compaction` block's `tool_changes` differs from what was returned with the
      # block.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :compaction_tool_changes_mismatch)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
