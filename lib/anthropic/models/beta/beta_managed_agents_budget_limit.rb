# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsBudgetLimit < Anthropic::Internal::Type::BaseModel
        # @!attribute max_list_cost
        #   Maximum list cost the session may accrue. List price is used regardless of any
        #   negotiated discount, so the cap fires at or before the actual charge.
        #
        #   @return [Anthropic::Models::BetaMonetaryAmount]
        required :max_list_cost, -> { Anthropic::BetaMonetaryAmount }

        # @!attribute type
        #
        #   @return [Symbol, :limit]
        required :type, const: :limit

        # @!method initialize(max_list_cost:, type: :limit)
        #   A hard spend ceiling. The session stops issuing new model requests once the
        #   tracked list cost reaches `max_list_cost`.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit} for more details.
        #
        #   @param max_list_cost [Anthropic::Models::BetaMonetaryAmount] Maximum list cost the session may accrue. List price is used regardless of any n
        #
        #   @param type [Symbol, :limit]
      end
    end

    BetaManagedAgentsBudgetLimit = Beta::BetaManagedAgentsBudgetLimit
  end
end
