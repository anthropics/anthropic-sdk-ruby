# typed: strong

module Anthropic
  module Models
    class CompactionNothingToSummarizeErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CompactionNothingToSummarizeErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # `messages` holds no `user` or `assistant` content to summarize or adopt.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :compaction_nothing_to_summarize)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
