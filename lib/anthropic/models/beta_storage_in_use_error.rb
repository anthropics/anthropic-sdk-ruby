# frozen_string_literal: true

module Anthropic
  module Models
    # The bucket is already in use, or was in use recently. Name a different bucket.
    class BetaStorageInUseError < Anthropic::Errors::ConflictError
      # @!method error_code
      #   @return [Symbol, :storage_in_use]

      # @return [Anthropic::Models::BetaStorageInUseErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaStorageInUseErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
