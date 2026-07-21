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

          # The request could enable cyber harm, such as malware or exploit development. Benign cybersecurity work can also trigger this category.
          CYBER = :cyber

          # The request could enable biological harm, such as dangerous lab methods. Beneficial life sciences work can also trigger this category.
          BIO = :bio

          # The request could assist the development of competing AI models, which is restricted under [Anthropic's commercial terms](https://www.anthropic.com/legal/commercial-terms). Benign machine learning work can also trigger this category.
          FRONTIER_LLM = :frontier_llm

          # The request asks the model to reproduce its internal reasoning in the response text. To get reasoning in a structured form instead, use [adaptive thinking](https://platform.claude.com/docs/en/build-with-claude/adaptive-thinking).
          REASONING_EXTRACTION = :reasoning_extraction

          # The request could be related to an area that was determined as harmful. Benign work might sometimes trigger this category.
          GENERAL_HARMS = :general_harms

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaFallbackRefusalTrigger = Beta::BetaFallbackRefusalTrigger
  end
end
