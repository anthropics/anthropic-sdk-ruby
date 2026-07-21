# frozen_string_literal: true

module Anthropic
  module Models
    class RefusalStopDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute category
      #   The policy category that triggered a refusal.
      #
      #   @return [Symbol, Anthropic::Models::RefusalStopDetails::Category, nil]
      required :category, enum: -> { Anthropic::RefusalStopDetails::Category }, nil?: true

      # @!attribute explanation
      #   Human-readable explanation of the refusal.
      #
      #   This text is not guaranteed to be stable. `null` when no explanation is
      #   available for the category.
      #
      #   @return [String, nil]
      required :explanation, String, nil?: true

      # @!attribute type
      #
      #   @return [Symbol, :refusal]
      required :type, const: :refusal

      # @!method initialize(category:, explanation:, type: :refusal)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::RefusalStopDetails} for more details.
      #
      #   Structured information about a refusal.
      #
      #   @param category [Symbol, Anthropic::Models::RefusalStopDetails::Category, nil] The policy category that triggered a refusal.
      #
      #   @param explanation [String, nil] Human-readable explanation of the refusal.
      #
      #   @param type [Symbol, :refusal]

      # The policy category that triggered a refusal.
      #
      # @see Anthropic::Models::RefusalStopDetails#category
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
end
