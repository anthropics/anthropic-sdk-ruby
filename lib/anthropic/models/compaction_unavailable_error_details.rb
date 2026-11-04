# frozen_string_literal: true

module Anthropic
  module Models
    class CompactionUnavailableErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :compaction_unavailable]
      required :error_code, const: :compaction_unavailable

      # @!method initialize(error_code: :compaction_unavailable)
      #   The compaction could not be completed for a transient server reason. Retry the
      #   request.
      #
      #   @param error_code [Symbol, :compaction_unavailable]
    end
  end
end
