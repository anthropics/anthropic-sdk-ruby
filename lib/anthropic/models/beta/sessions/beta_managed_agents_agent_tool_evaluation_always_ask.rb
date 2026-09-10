# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentToolEvaluationAlwaysAsk < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :always_ask]
          required :type, const: :always_ask

          # @!method initialize(type: :always_ask)
          #   The resolved permission_policy was always_ask; accompanies evaluated_permission
          #   "ask".
          #
          #   @param type [Symbol, :always_ask]
        end
      end
    end
  end
end
