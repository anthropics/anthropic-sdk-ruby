# frozen_string_literal: true

module Anthropic
  module Models
    class CompactionIncompleteTurnErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :compaction_incomplete_turn]
      required :error_code, const: :compaction_incomplete_turn

      # @!method initialize(error_code: :compaction_incomplete_turn)
      #   The compaction request ends on an `assistant` turn that is not finished.
      #
      #   @param error_code [Symbol, :compaction_incomplete_turn]
    end
  end
end
