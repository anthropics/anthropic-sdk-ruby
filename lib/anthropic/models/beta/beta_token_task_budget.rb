# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTokenTaskBudget < Anthropic::Internal::Type::BaseModel
        # @!attribute total
        #   Total token budget across all contexts in the session.
        #
        #   @return [Integer]
        required :total, Integer

        # @!attribute type
        #   The budget type. Currently only 'tokens' is supported.
        #
        #   @return [Symbol, :tokens]
        required :type, const: :tokens

        # @!attribute remaining
        #   Remaining tokens in the budget. Use this to track usage across contexts when
        #   implementing compaction client-side. Defaults to total if not provided.
        #
        #   @return [Integer, nil]
        optional :remaining, Integer, nil?: true

        # @!method initialize(total:, remaining: nil, type: :tokens)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaTokenTaskBudget} for more details.
        #
        #   User-configurable total token budget across contexts.
        #
        #   @param total [Integer] Total token budget across all contexts in the session.
        #
        #   @param remaining [Integer, nil] Remaining tokens in the budget. Use this to track usage across contexts when imp
        #
        #   @param type [Symbol, :tokens] The budget type. Currently only 'tokens' is supported.
      end
    end

    BetaTokenTaskBudget = Beta::BetaTokenTaskBudget
  end
end
