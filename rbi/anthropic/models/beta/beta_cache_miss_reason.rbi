# typed: strong

module Anthropic
  module Models
    BetaCacheMissReason = Beta::BetaCacheMissReason

    module Beta
      module BetaCacheMissReason
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
              T.all(Symbol, Anthropic::Beta::BetaCacheMissReason::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MODEL_CHANGED =
            T.let(
              :model_changed,
              Anthropic::Beta::BetaCacheMissReason::Type::TaggedSymbol
            )
          SYSTEM_CHANGED =
            T.let(
              :system_changed,
              Anthropic::Beta::BetaCacheMissReason::Type::TaggedSymbol
            )
          TOOLS_CHANGED =
            T.let(
              :tools_changed,
              Anthropic::Beta::BetaCacheMissReason::Type::TaggedSymbol
            )
          MESSAGES_CHANGED =
            T.let(
              :messages_changed,
              Anthropic::Beta::BetaCacheMissReason::Type::TaggedSymbol
            )
          PREVIOUS_MESSAGE_NOT_FOUND =
            T.let(
              :previous_message_not_found,
              Anthropic::Beta::BetaCacheMissReason::Type::TaggedSymbol
            )
          UNAVAILABLE =
            T.let(
              :unavailable,
              Anthropic::Beta::BetaCacheMissReason::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaCacheMissReason::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaCacheMissReason::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaCacheMissReason::Type::OrSymbol,
            cache_missed_input_tokens: Integer
          ).returns(Anthropic::Beta::BetaCacheMissReason::Variants)
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
