# typed: strong

module Anthropic
  module Models
    class ThreadUnsupportedRequestErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ThreadUnsupportedRequestErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # Each entry names a request field or an organization setting that Threads do not
      # support. On a value you do not recognize, send the full conversation without
      # `thread`.
      sig do
        returns(
          T.nilable(
            T::Array[Anthropic::ThreadUnsupportedFeatureName::TaggedSymbol]
          )
        )
      end
      attr_accessor :unsupported

      # The request combines `thread` with a request field or an organization setting
      # that Threads do not support; `unsupported`, when present, names it. Send the
      # full conversation without `thread`, or change that field.
      sig do
        params(
          unsupported:
            T.nilable(
              T::Array[Anthropic::ThreadUnsupportedFeatureName::OrSymbol]
            ),
          error_code: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Each entry names a request field or an organization setting that Threads do not
        # support. On a value you do not recognize, send the full conversation without
        # `thread`.
        unsupported: nil,
        error_code: :thread_unsupported_request
      )
      end

      sig do
        override.returns(
          {
            error_code: Symbol,
            unsupported:
              T.nilable(
                T::Array[Anthropic::ThreadUnsupportedFeatureName::TaggedSymbol]
              )
          }
        )
      end
      def to_hash
      end
    end
  end
end
