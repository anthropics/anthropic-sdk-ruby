# frozen_string_literal: true

module Anthropic
  module Models
    # The file's `expires_at` has passed, so its content is no longer available.
    class FileExpiredError < Anthropic::Errors::NotFoundError
      # @!method error_code
      #   @return [Symbol, :file_expired]

      # @return [Anthropic::Models::FileExpiredErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::FileExpiredErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
