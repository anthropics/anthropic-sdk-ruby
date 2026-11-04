# typed: strong

module Anthropic
  module Models
    class ThreadNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ThreadNotFoundErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # No usable Thread state was found for `previous_message_id`. Replay the full
      # conversation with `thread: {"type": "create"}` to start a new Thread.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :thread_not_found)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
