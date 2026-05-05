# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsTextRubricParams < Anthropic::Internal::Type::BaseModel
          # @!attribute content
          #   Rubric content. Plain text or markdown — the grader treats it as freeform text.
          #   Maximum 262144 characters.
          #
          #   @return [String]
          required :content, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubricParams::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::Type }

          # @!method initialize(content:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubricParams} for more
          #   details.
          #
          #   Rubric content provided inline as text.
          #
          #   @param content [String] Rubric content. Plain text or markdown — the grader treats it as freeform text.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubricParams::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubricParams#type
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
