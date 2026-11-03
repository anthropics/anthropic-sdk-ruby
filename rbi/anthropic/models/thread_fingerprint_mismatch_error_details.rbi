# typed: strong

module Anthropic
  module Models
    class ThreadFingerprintMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ThreadFingerprintMismatchErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # A field that must stay the same across a Thread's turns differs from the value
      # stored with the Thread; the message names each such field. Send the stored
      # values, or replay the full conversation with `thread: {"type": "create"}` to
      # change them.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :thread_fingerprint_mismatch)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
