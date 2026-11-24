# frozen_string_literal: true

module Anthropic
  module Models
    # Anthropic has not approved keeping data in a customer-owned storage bucket for
    # the organization, project or user profile this request applies to, or has paused
    # or withdrawn its approval. If you did not expect this, contact Anthropic.
    class BetaStorageNotApprovedError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :storage_not_approved]

      # @return [Anthropic::Models::BetaStorageNotApprovedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaStorageNotApprovedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
