# frozen_string_literal: true

module Anthropic
  module Models
    # The workspace's encryption settings could not be read, so the request was
    # refused. Retry in a few minutes.
    class CMEKContextUnavailableError < Anthropic::Errors::ServiceUnavailableError
      # @!method error_code
      #   @return [Symbol, :cmek_context_unavailable]

      # @return [Anthropic::Models::CMEKContextUnavailableErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CMEKContextUnavailableErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
