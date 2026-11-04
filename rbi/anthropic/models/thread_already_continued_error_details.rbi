# typed: strong

module Anthropic
  module Models
    class ThreadAlreadyContinuedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ThreadAlreadyContinuedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The response that `previous_message_id` names has already been continued, and
      # each response can be continued only once. Continue from the Thread's most recent
      # response `id`.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :thread_already_continued)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
