# typed: strong

module Anthropic
  module Models
    class CompactionUnavailableErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CompactionUnavailableErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The compaction could not be completed for a transient server reason. Retry the
      # request.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :compaction_unavailable)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
