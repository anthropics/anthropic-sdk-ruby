# frozen_string_literal: true

module Anthropic
  module Models
    # Some of the request's changes may have been saved and others not. Send the same
    # request again to finish it; changes already saved aren't repeated.
    class ChangeOutcomeUnknownError < Anthropic::Errors::ServiceUnavailableError
      # @!method error_code
      #   @return [Symbol, :change_outcome_unknown]

      # @return [Anthropic::Models::ChangeOutcomeUnknownErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ChangeOutcomeUnknownErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
