# frozen_string_literal: true

module Anthropic
  module Models
    # The conversation references more distinct tools than a `compaction` block can
    # record.
    class CompactionTooManyToolReferencesError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :compaction_too_many_tool_references]

      # @return [Anthropic::Models::CompactionTooManyToolReferencesErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CompactionTooManyToolReferencesErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
