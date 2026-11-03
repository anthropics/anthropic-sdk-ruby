# frozen_string_literal: true

module Anthropic
  module Models
    class EnforcedSpendLimitReachedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :enforced_spend_limit_reached]
      required :error_code, const: :enforced_spend_limit_reached

      # @!method initialize(error_code: :enforced_spend_limit_reached)
      #   The organization has crossed the monthly API usage threshold of its API tier.
      #
      #   @param error_code [Symbol, :enforced_spend_limit_reached]
    end
  end
end
