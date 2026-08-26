# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationRateLimitValue < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   The limiter type (for example, `requests_per_minute` or
          #   `input_tokens_per_minute`).
          #
          #   @return [String]
          required :type, String

          # @!attribute value
          #   The configured limit value for this limiter type.
          #
          #   @return [Integer]
          required :value, Integer

          # @!method initialize(type:, value:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaOrganizationRateLimitValue} for more
          #   details.
          #
          #   @param type [String] The limiter type (for example, `requests_per_minute` or `input_tokens_per_minute
          #
          #   @param value [Integer] The configured limit value for this limiter type.
        end
      end
    end
  end
end
