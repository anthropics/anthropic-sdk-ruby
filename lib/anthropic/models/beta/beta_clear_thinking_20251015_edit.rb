# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaClearThinking20251015Edit < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :clear_thinking_20251015]
        required :type, const: :clear_thinking_20251015

        # @!attribute keep
        #   Number of most recent assistant turns to keep thinking blocks for. Older turns
        #   will have their thinking blocks removed.
        #
        #   @return [Anthropic::Models::Beta::BetaThinkingTurns, Anthropic::Models::Beta::BetaAllThinkingTurns, Symbol, :all, nil]
        optional :keep, union: -> { Anthropic::Beta::BetaClearThinking20251015Edit::Keep }

        # @!method initialize(keep: nil, type: :clear_thinking_20251015)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaClearThinking20251015Edit} for more details.
        #
        #   @param keep [Anthropic::Models::Beta::BetaThinkingTurns, Anthropic::Models::Beta::BetaAllThinkingTurns, Symbol, :all] Number of most recent assistant turns to keep thinking blocks for. Older turns w
        #
        #   @param type [Symbol, :clear_thinking_20251015]

        # Number of most recent assistant turns to keep thinking blocks for. Older turns
        # will have their thinking blocks removed.
        #
        # @see Anthropic::Models::Beta::BetaClearThinking20251015Edit#keep
        module Keep
          extend Anthropic::Internal::Type::Union

          variant -> { Anthropic::Beta::BetaThinkingTurns }

          variant -> { Anthropic::Beta::BetaAllThinkingTurns }

          variant const: :all

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaThinkingTurns, Anthropic::Models::Beta::BetaAllThinkingTurns, Symbol, :all)]
        end
      end
    end

    BetaClearThinking20251015Edit = Beta::BetaClearThinking20251015Edit
  end
end
