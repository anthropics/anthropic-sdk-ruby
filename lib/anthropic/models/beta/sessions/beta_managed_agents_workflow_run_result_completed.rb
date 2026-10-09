# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunResultCompleted < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :completed]
          required :type, const: :completed

          # @!method initialize(type: :completed)
          #   The run's plan, a program that the agent wrote, finished. This does not say
          #   whether the work succeeded.
          #
          #   @param type [Symbol, :completed]
        end
      end
    end
  end
end
