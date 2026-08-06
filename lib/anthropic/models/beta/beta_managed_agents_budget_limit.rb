# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsBudgetLimit < Anthropic::Internal::Type::BaseModel
        # @!attribute max_list_cost
        #   A monetary amount in a specific currency.
        #
        #   @return [Anthropic::Models::BetaMonetaryAmount]
        required :max_list_cost, -> { Anthropic::BetaMonetaryAmount }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsBudgetLimit::Type }

        # @!method initialize(max_list_cost:, type:)
        #   A hard spend ceiling. The session stops issuing new model requests once the
        #   tracked list cost reaches `max_list_cost`.
        #
        #   @param max_list_cost [Anthropic::Models::BetaMonetaryAmount] A monetary amount in a specific currency.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit#type
        module Type
          extend Anthropic::Internal::Type::Enum

          LIMIT = :limit

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsBudgetLimit = Beta::BetaManagedAgentsBudgetLimit
  end
end
