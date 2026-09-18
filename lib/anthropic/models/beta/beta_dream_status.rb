# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Lifecycle status of a Dream.
      module BetaDreamStatus
        extend Anthropic::Internal::Type::Enum

        # The dream is waiting to start and hasn't read its inputs yet.
        #
        # `outputs` is empty and every `usage` count is zero.
        PENDING = :pending

        # The dream is reading its inputs and writing its result.
        #
        # `usage` updates while the dream has this status.
        RUNNING = :running

        # The dream finished and its output memory store holds the complete result.
        COMPLETED = :completed

        # The dream stopped with an error, which `error` describes.
        #
        # If `outputs` references a memory store, that memory store keeps what the dream wrote before it stopped.
        FAILED = :failed

        # The caller canceled the dream before it completed.
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaDreamStatus = Beta::BetaDreamStatus
  end
end
