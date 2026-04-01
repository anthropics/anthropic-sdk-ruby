# frozen_string_literal: true

module Anthropic
  module Models
    class RefusalStopDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute category
      #   The policy category that triggered the refusal.
      #
      #   `null` when the refusal doesn't map to a named category.
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
      #   @param category [Symbol, Anthropic::Models::RefusalStopDetails::Category, nil] The policy category that triggered the refusal.
      #
      #   @param explanation [String, nil] Human-readable explanation of the refusal.
      #
      #   @param type [Symbol, :refusal]

      # The policy category that triggered the refusal.
      #
      # `null` when the refusal doesn't map to a named category.
      #
      # @see Anthropic::Models::RefusalStopDetails#category
      module Category
        extend Anthropic::Internal::Type::Enum

        CYBER = :cyber
        BIO = :bio

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
