# frozen_string_literal: true

module Anthropic
  module Models
    # The compaction request ends on an `assistant` turn that is not finished.
    class CompactionIncompleteTurnError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :compaction_incomplete_turn]

      # @return [Anthropic::Models::CompactionIncompleteTurnErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CompactionIncompleteTurnErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
