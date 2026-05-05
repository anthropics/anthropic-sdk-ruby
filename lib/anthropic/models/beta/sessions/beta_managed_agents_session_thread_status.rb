# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # SessionThreadStatus enum
        module BetaManagedAgentsSessionThreadStatus
          extend Anthropic::Internal::Type::Enum

          RUNNING = :running
          IDLE = :idle
          RESCHEDULING = :rescheduling
          TERMINATED = :terminated

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
