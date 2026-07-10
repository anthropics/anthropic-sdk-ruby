# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Lifecycle status of a Dream.
      module BetaDreamStatus
        extend Anthropic::Internal::Type::Enum

        PENDING = :pending
        RUNNING = :running
        COMPLETED = :completed
        FAILED = :failed
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaDreamStatus = Beta::BetaDreamStatus
  end
end
