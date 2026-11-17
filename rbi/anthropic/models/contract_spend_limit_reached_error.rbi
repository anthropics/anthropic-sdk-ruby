# typed: strong

module Anthropic
  module Models
    # The organization has reached the spend limit of its contract.
    class ContractSpendLimitReachedError < Anthropic::Errors::RateLimitError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ContractSpendLimitReachedErrorDetails) }
      def details
      end
    end
  end
end
