# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsTextRubric < Anthropic::Internal::Type::BaseModel
          # @!attribute content
          #   Rubric content. Plain text or markdown — the grader treats it as freeform text.
          #
          #   @return [String]
          required :content, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric::Type }

          # @!method initialize(content:, type:)
          #   Rubric content provided inline as text.
          #
          #   @param content [String] Rubric content. Plain text or markdown — the grader treats it as freeform text.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric#type
          module Type
            extend Anthropic::Internal::Type::Enum

            TEXT = :text

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
