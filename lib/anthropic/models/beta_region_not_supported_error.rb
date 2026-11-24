# frozen_string_literal: true

module Anthropic
  module Models
    # The request names a region code that the control does not take from this
    # organization. The message names the field.
    class BetaRegionNotSupportedError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :region_not_supported]

      # @return [Anthropic::Models::BetaRegionNotSupportedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaRegionNotSupportedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
