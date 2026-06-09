# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # What triggered a deployment run.
      module BetaManagedAgentsTriggerType
        extend Anthropic::Internal::Type::Enum

        SCHEDULE = :schedule
        MANUAL = :manual

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaManagedAgentsTriggerType = Beta::BetaManagedAgentsTriggerType
  end
end
