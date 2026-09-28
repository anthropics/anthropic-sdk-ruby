# typed: strong

module Anthropic
  module Models
    BetaDiagnostics = Beta::BetaDiagnostics

    module Beta
      class BetaDiagnostics < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDiagnostics,
              Anthropic::Internal::AnyHash
            )
          end

        # Explains why the prompt cache could not fully reuse the prefix from the request
        # identified by `diagnostics.previous_message_id`. `null` means diagnosis is still
        # pending — the response was serialized before the background comparison
        # completed.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaCacheMissReason::Variants))
        end
        attr_accessor :cache_miss_reason

        # Request-level diagnostics: why the prompt cache could not fully reuse the prefix
        # of the request named by `diagnostics.previous_message_id`.
        sig do
          params(
            cache_miss_reason:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaCacheMissModelChanged::OrHash,
                  Anthropic::Beta::BetaCacheMissSystemChanged::OrHash,
                  Anthropic::Beta::BetaCacheMissToolsChanged::OrHash,
                  Anthropic::Beta::BetaCacheMissMessagesChanged::OrHash,
                  Anthropic::Beta::BetaCacheMissPreviousMessageNotFound::OrHash,
                  Anthropic::Beta::BetaCacheMissUnavailable::OrHash
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
            {
              cache_miss_reason:
                T.nilable(Anthropic::Beta::BetaCacheMissReason::Variants)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
