# frozen_string_literal: true

module Anthropic
  module Models
    # Anthropic has not approved customer-managed encryption keys for the
    # organization, project or user profile this request applies to, or has paused or
    # withdrawn its approval. If you did not expect this, contact Anthropic.
    class BetaCMEKNotApprovedError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :cmek_not_approved]

      # @return [Anthropic::Models::BetaCMEKNotApprovedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaCMEKNotApprovedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
