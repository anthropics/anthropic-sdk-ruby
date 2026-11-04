# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # `metadata` has too many keys, a key or value that is too long, or a reserved
      # key. The message names each problem.
      class BetaInvalidMetadataError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :invalid_metadata]

        # @return [Anthropic::Models::Beta::BetaInvalidMetadataErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaInvalidMetadataErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
