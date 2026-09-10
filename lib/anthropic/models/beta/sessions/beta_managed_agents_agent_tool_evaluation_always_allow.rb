# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentToolEvaluationAlwaysAllow < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :always_allow]
          required :type, const: :always_allow

          # @!method initialize(type: :always_allow)
          #   The resolved permission_policy was always_allow; accompanies
          #   evaluated_permission "allow".
          #
          #   @param type [Symbol, :always_allow]
        end
      end
    end
  end
end
