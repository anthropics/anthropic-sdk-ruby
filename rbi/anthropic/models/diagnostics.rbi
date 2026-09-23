# typed: strong

module Anthropic
  module Models
    class Diagnostics < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::Diagnostics, Anthropic::Internal::AnyHash)
        end

      # Explains why the prompt cache could not fully reuse the prefix from the request
      # identified by `diagnostics.previous_message_id`. `null` means diagnosis is still
      # pending — the response was serialized before the background comparison
      # completed.
      sig { returns(T.nilable(Anthropic::CacheMissReason::Variants)) }
      attr_accessor :cache_miss_reason

      # Request-level diagnostics: why the prompt cache could not fully reuse the prefix
      # of the request named by `diagnostics.previous_message_id`.
      sig do
        params(
          cache_miss_reason:
            T.nilable(
              T.any(
                Anthropic::CacheMissModelChanged::OrHash,
                Anthropic::CacheMissSystemChanged::OrHash,
                Anthropic::CacheMissToolsChanged::OrHash,
                Anthropic::CacheMissMessagesChanged::OrHash,
                Anthropic::CacheMissPreviousMessageNotFound::OrHash,
                Anthropic::CacheMissUnavailable::OrHash
              )
            )
        ).returns(T.attached_class)
      end
      def self.new(
        # Explains why the prompt cache could not fully reuse the prefix from the request
        # identified by `diagnostics.previous_message_id`. `null` means diagnosis is still
        # pending — the response was serialized before the background comparison
        # completed.
        cache_miss_reason:
      )
      end

      sig do
        override.returns(
          { cache_miss_reason: T.nilable(Anthropic::CacheMissReason::Variants) }
        )
      end
      def to_hash
      end
    end
  end
end
