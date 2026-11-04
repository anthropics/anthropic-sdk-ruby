# frozen_string_literal: true

module Anthropic
  module Models
    # The compaction could not be completed for a transient server reason. Retry the
    # request.
    class CompactionUnavailableError < Anthropic::Errors::OverloadedError
      # @!method error_code
      #   @return [Symbol, :compaction_unavailable]

      # @return [Anthropic::Models::CompactionUnavailableErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CompactionUnavailableErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
