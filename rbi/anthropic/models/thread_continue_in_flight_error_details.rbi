# typed: strong

module Anthropic
  module Models
    class ThreadContinueInFlightErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ThreadContinueInFlightErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # Another request is still continuing from the same `previous_message_id`. Wait
      # for it to complete and continue from its response `id`, or replay the full
      # conversation with `thread: {"type": "create"}`.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :thread_continue_in_flight)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
