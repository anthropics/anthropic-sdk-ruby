# typed: strong

module Anthropic
  module Models
    BetaStopReason = Beta::BetaStopReason

    module Beta
      module BetaStopReason
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::Beta::BetaStopReason) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        END_TURN =
          T.let(:end_turn, Anthropic::Beta::BetaStopReason::TaggedSymbol)
        MAX_TOKENS =
          T.let(:max_tokens, Anthropic::Beta::BetaStopReason::TaggedSymbol)
        STOP_SEQUENCE =
          T.let(:stop_sequence, Anthropic::Beta::BetaStopReason::TaggedSymbol)
        TOOL_USE =
          T.let(:tool_use, Anthropic::Beta::BetaStopReason::TaggedSymbol)
        PAUSE_TURN =
          T.let(:pause_turn, Anthropic::Beta::BetaStopReason::TaggedSymbol)
        REFUSAL = T.let(:refusal, Anthropic::Beta::BetaStopReason::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaStopReason::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
