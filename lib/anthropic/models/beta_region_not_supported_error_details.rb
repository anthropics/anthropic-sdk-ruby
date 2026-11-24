# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRegionNotSupportedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :region_not_supported]
      required :error_code, const: :region_not_supported

      # @!method initialize(error_code: :region_not_supported)
      #   The request names a region code that the control does not take from this
      #   organization. The message names the field.
      #
      #   @param error_code [Symbol, :region_not_supported]
    end
  end
end
