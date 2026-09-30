# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionRefusalStopDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute category
          #   The policy category that triggered the refusal, or `null` when there is no named
          #   category. New values can be added over time.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category, nil]
          required :category,
                   enum: -> {
                     Anthropic::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category
                   },
                   nil?: true

          # @!attribute explanation
          #   Human-readable explanation of the refusal, or `null` when none is available. The
          #   wording can change, so do not parse it.
          #
          #   @return [String, nil]
          required :explanation, String, nil?: true

          # @!attribute type
          #
          #   @return [Symbol, :refusal]
          required :type, const: :refusal

          # @!method initialize(category:, explanation:, type: :refusal)
          #   Structured information about a refusal.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails}
          #   for more details.
          #
          #   @param category [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails::Category, nil] The policy category that triggered the refusal, or `null` when there is no named
          #
          #   @param explanation [String, nil] Human-readable explanation of the refusal, or `null` when none is available. The
          #
          #   @param type [Symbol, :refusal]

          # The policy category that triggered the refusal, or `null` when there is no named
          # category. New values can be added over time.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRefusalStopDetails#category
          module Category
            extend Anthropic::Internal::Type::Enum

            CYBER = :cyber
            BIO = :bio
            FRONTIER_LLM = :frontier_llm
            REASONING_EXTRACTION = :reasoning_extraction
            GENERAL_HARMS = :general_harms

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
