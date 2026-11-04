# typed: strong

module Anthropic
  module Models
    class CompactionTooManyToolReferencesErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CompactionTooManyToolReferencesErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The conversation references more distinct tools than a `compaction` block can
      # record.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :compaction_too_many_tool_references)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
