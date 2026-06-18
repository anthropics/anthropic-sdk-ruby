# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackRefusalTrigger < Anthropic::Internal::Type::BaseModel
        # @!attribute category
        #   The policy category that triggered a refusal.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaFallbackRefusalTrigger::Category, nil]
        required :category, enum: -> { Anthropic::Beta::BetaFallbackRefusalTrigger::Category }, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :refusal]
        required :type, const: :refusal

        # @!method initialize(category:, type: :refusal)
        #   The `from` model declined for policy reasons.
        #
        #   @param category [Symbol, Anthropic::Models::Beta::BetaFallbackRefusalTrigger::Category, nil] The policy category that triggered a refusal.
        #
        #   @param type [Symbol, :refusal]

        # The policy category that triggered a refusal.
        #
        # @see Anthropic::Models::Beta::BetaFallbackRefusalTrigger#category
        module Category
          extend Anthropic::Internal::Type::Enum

          CYBER = :cyber
          BIO = :bio
          FRONTIER_LLM = :frontier_llm
          REASONING_EXTRACTION = :reasoning_extraction

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaFallbackRefusalTrigger = Beta::BetaFallbackRefusalTrigger
  end
end
