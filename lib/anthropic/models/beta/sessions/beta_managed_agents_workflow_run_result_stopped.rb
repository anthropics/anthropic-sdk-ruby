# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunResultStopped < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :stopped]
          required :type, const: :stopped

          # @!method initialize(type: :stopped)
          #   The agent stopped the run.
          #
          #   @param type [Symbol, :stopped]
        end
      end
    end
  end
end
