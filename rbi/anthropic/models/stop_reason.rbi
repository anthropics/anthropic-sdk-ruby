# typed: strong

module Anthropic
  module Models
    module StopReason
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::StopReason) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      END_TURN = T.let(:end_turn, Anthropic::StopReason::TaggedSymbol)
      MAX_TOKENS = T.let(:max_tokens, Anthropic::StopReason::TaggedSymbol)
      STOP_SEQUENCE = T.let(:stop_sequence, Anthropic::StopReason::TaggedSymbol)
      TOOL_USE = T.let(:tool_use, Anthropic::StopReason::TaggedSymbol)
      PAUSE_TURN = T.let(:pause_turn, Anthropic::StopReason::TaggedSymbol)
      REFUSAL = T.let(:refusal, Anthropic::StopReason::TaggedSymbol)

      sig { override.returns(T::Array[Anthropic::StopReason::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
