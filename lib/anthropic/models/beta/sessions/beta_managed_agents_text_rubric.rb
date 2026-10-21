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
          #   @return [Symbol, :text]
          required :type, const: :text

          # @!method initialize(content:, type: :text)
          #   Rubric content provided inline as text.
          #
          #   @param content [String] Rubric content. Plain text or markdown — the grader treats it as freeform text.
          #
          #   @param type [Symbol, :text]
        end
      end
    end
  end
end
