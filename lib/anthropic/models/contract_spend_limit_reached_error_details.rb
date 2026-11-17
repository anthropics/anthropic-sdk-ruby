# frozen_string_literal: true

module Anthropic
  module Models
    class ContractSpendLimitReachedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :contract_spend_limit_reached]
      required :error_code, const: :contract_spend_limit_reached

      # @!method initialize(error_code: :contract_spend_limit_reached)
      #   The organization has reached the spend limit of its contract.
      #
      #   @param error_code [Symbol, :contract_spend_limit_reached]
    end
  end
end
