# typed: strong

module Anthropic
  module Models
    # The organization has crossed the monthly API usage threshold of its API tier.
    class EnforcedSpendLimitReachedError < Anthropic::Errors::RateLimitError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::EnforcedSpendLimitReachedErrorDetails) }
      def details
      end
    end
  end
end
