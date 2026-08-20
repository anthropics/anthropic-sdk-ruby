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
          returns(
            T.nilable(
              Anthropic::Beta::BetaDiagnostics::CacheMissReason::Variants
            )
          )
        end
        attr_accessor :cache_miss_reason

        # Response envelope for request-level diagnostics. Present (possibly null)
        # whenever the caller supplied `diagnostics` on the request.
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
                T.nilable(
                  Anthropic::Beta::BetaDiagnostics::CacheMissReason::Variants
                )
            }
          )
        end
        def to_hash
        end

        # Explains why the prompt cache could not fully reuse the prefix from the request
        # identified by `diagnostics.previous_message_id`. `null` means diagnosis is still
        # pending — the response was serialized before the background comparison
        # completed.
        module CacheMissReason
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaCacheMissModelChanged,
                Anthropic::Beta::BetaCacheMissSystemChanged,
                Anthropic::Beta::BetaCacheMissToolsChanged,
                Anthropic::Beta::BetaCacheMissMessagesChanged,
                Anthropic::Beta::BetaCacheMissPreviousMessageNotFound,
                Anthropic::Beta::BetaCacheMissUnavailable
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaDiagnostics::CacheMissReason::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            MODEL_CHANGED =
              T.let(
                :model_changed,
                Anthropic::Beta::BetaDiagnostics::CacheMissReason::Type::TaggedSymbol
              )
            SYSTEM_CHANGED =
              T.let(
                :system_changed,
                Anthropic::Beta::BetaDiagnostics::CacheMissReason::Type::TaggedSymbol
              )
            TOOLS_CHANGED =
              T.let(
                :tools_changed,
                Anthropic::Beta::BetaDiagnostics::CacheMissReason::Type::TaggedSymbol
              )
            MESSAGES_CHANGED =
              T.let(
                :messages_changed,
                Anthropic::Beta::BetaDiagnostics::CacheMissReason::Type::TaggedSymbol
              )
            PREVIOUS_MESSAGE_NOT_FOUND =
              T.let(
                :previous_message_not_found,
                Anthropic::Beta::BetaDiagnostics::CacheMissReason::Type::TaggedSymbol
              )
            UNAVAILABLE =
              T.let(
                :unavailable,
                Anthropic::Beta::BetaDiagnostics::CacheMissReason::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaDiagnostics::CacheMissReason::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaDiagnostics::CacheMissReason::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              cache_missed_input_tokens: Integer
            ).returns(
              Anthropic::Beta::BetaDiagnostics::CacheMissReason::Variants
            )
          end
          def self.new(
            type:,
            # Approximate number of input tokens that would have been read from cache had the
            # prefix matched the previous request.
            cache_missed_input_tokens: nil
          )
          end
        end
      end
    end
  end
end
