# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserInterruptEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, :"user.interrupt"]
          required :type, const: :"user.interrupt"

          # @!attribute processed_at
          #   Timestamp when the interrupt was processed.
          #
          #   @return [Time, nil]
          optional :processed_at, Time, nil?: true

          # @!attribute session_thread_id
          #   If absent, interrupts every non-archived thread in a multiagent session (or the
          #   primary alone in a single-agent session). If present, interrupts only the named
          #   thread.
          #
          #   @return [String, nil]
          optional :session_thread_id, String, nil?: true

          # @!method initialize(id:, processed_at: nil, session_thread_id: nil, type: :"user.interrupt")
          #   An interrupt event that pauses agent execution and returns control to the user.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent} for
          #   more details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time, nil] Timestamp when the interrupt was processed.
          #
          #   @param session_thread_id [String, nil] If absent, interrupts every non-archived thread in a multiagent session (or the
          #
          #   @param type [Symbol, :"user.interrupt"]
        end
      end
    end
  end
end
