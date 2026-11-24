# frozen_string_literal: true

module Anthropic
  module Models
    # The organization has not proved that it owns the Google Cloud project that holds
    # the key or bucket. The message names the field.
    class BetaGCPProjectNotVerifiedError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :gcp_project_not_verified]

      # @return [Anthropic::Models::BetaGCPProjectNotVerifiedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaGCPProjectNotVerifiedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
