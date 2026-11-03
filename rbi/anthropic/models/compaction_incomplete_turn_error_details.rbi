# typed: strong

module Anthropic
  module Models
    class CompactionIncompleteTurnErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CompactionIncompleteTurnErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The compaction request ends on an `assistant` turn that is not finished.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :compaction_incomplete_turn)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
