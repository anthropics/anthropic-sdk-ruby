# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaStopReason
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::Beta::BetaStopReason) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        END_TURN = T.let(:end_turn, Anthropic::Models::Beta::BetaStopReason::TaggedSymbol)
        MAX_TOKENS = T.let(:max_tokens, Anthropic::Models::Beta::BetaStopReason::TaggedSymbol)
        STOP_SEQUENCE = T.let(:stop_sequence, Anthropic::Models::Beta::BetaStopReason::TaggedSymbol)
        TOOL_USE = T.let(:tool_use, Anthropic::Models::Beta::BetaStopReason::TaggedSymbol)

        sig { override.returns(T::Array[Anthropic::Models::Beta::BetaStopReason::TaggedSymbol]) }
        def self.values; end
      end
    end

    BetaStopReason = Beta::BetaStopReason
  end
end
