# frozen_string_literal: true

module Anthropic
  module Models
    # The organization has reached the spend limit of its contract.
    class ContractSpendLimitReachedError < Anthropic::Errors::RateLimitError
      # @!method error_code
      #   @return [Symbol, :contract_spend_limit_reached]

      # @return [Anthropic::Models::ContractSpendLimitReachedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ContractSpendLimitReachedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
