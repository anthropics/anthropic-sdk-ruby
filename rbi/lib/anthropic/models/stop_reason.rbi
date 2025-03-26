# typed: strong

module Anthropic
  module Models
    module StopReason
      extend Anthropic::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::StopReason) }
      OrSymbol = T.type_alias { T.any(Symbol, Anthropic::Models::StopReason::TaggedSymbol) }

      END_TURN = T.let(:end_turn, Anthropic::Models::StopReason::TaggedSymbol)
      MAX_TOKENS = T.let(:max_tokens, Anthropic::Models::StopReason::TaggedSymbol)
      STOP_SEQUENCE = T.let(:stop_sequence, Anthropic::Models::StopReason::TaggedSymbol)
      TOOL_USE = T.let(:tool_use, Anthropic::Models::StopReason::TaggedSymbol)

      sig { override.returns(T::Array[Anthropic::Models::StopReason::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
