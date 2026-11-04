# frozen_string_literal: true

module Anthropic
  module Models
    # The organization has crossed the monthly API usage threshold of its API tier.
    class EnforcedSpendLimitReachedError < Anthropic::Errors::RateLimitError
      # @!method error_code
      #   @return [Symbol, :enforced_spend_limit_reached]

      # @return [Anthropic::Models::EnforcedSpendLimitReachedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::EnforcedSpendLimitReachedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
