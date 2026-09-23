# typed: strong

module Anthropic
  module Models
    module CacheMissReason
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::CacheMissModelChanged,
            Anthropic::CacheMissSystemChanged,
            Anthropic::CacheMissToolsChanged,
            Anthropic::CacheMissMessagesChanged,
            Anthropic::CacheMissPreviousMessageNotFound,
            Anthropic::CacheMissUnavailable
          )
        end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::CacheMissReason::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MODEL_CHANGED =
          T.let(:model_changed, Anthropic::CacheMissReason::Type::TaggedSymbol)
        SYSTEM_CHANGED =
          T.let(:system_changed, Anthropic::CacheMissReason::Type::TaggedSymbol)
        TOOLS_CHANGED =
          T.let(:tools_changed, Anthropic::CacheMissReason::Type::TaggedSymbol)
        MESSAGES_CHANGED =
          T.let(
            :messages_changed,
            Anthropic::CacheMissReason::Type::TaggedSymbol
          )
        PREVIOUS_MESSAGE_NOT_FOUND =
          T.let(
            :previous_message_not_found,
            Anthropic::CacheMissReason::Type::TaggedSymbol
          )
        UNAVAILABLE =
          T.let(:unavailable, Anthropic::CacheMissReason::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::CacheMissReason::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      sig { override.returns(T::Array[Anthropic::CacheMissReason::Variants]) }
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: Anthropic::CacheMissReason::Type::OrSymbol,
          cache_missed_input_tokens: Integer
        ).returns(Anthropic::CacheMissReason::Variants)
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
