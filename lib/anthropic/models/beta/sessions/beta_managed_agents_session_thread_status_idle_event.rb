# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadStatusIdleEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute agent_name
          #   Name of the agent the thread runs.
          #
          #   @return [String]
          required :agent_name, String

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute session_thread_id
          #   Public sthr\_ ID of the thread that went idle.
          #
          #   @return [String]
          required :session_thread_id, String

          # @!attribute stop_reason
          #   The agent completed its turn naturally and is ready for the next user message.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEndTurn, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRequiresAction, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted]
          required :stop_reason,
                   union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::StopReason }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::Type }

          # @!method initialize(id:, agent_name:, processed_at:, session_thread_id:, stop_reason:, type:)
          #   A session thread has yielded and is awaiting input. Emitted on the thread's own
          #   stream and cross-posted to the primary stream for child threads.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param agent_name [String] Name of the agent the thread runs.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param session_thread_id [String] Public sthr\_ ID of the thread that went idle.
          #
          #   @param stop_reason [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEndTurn, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRequiresAction, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted] The agent completed its turn naturally and is ready for the next user message.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent::Type]

          # The agent completed its turn naturally and is ready for the next user message.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent#stop_reason
          module StopReason
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # The agent completed its turn naturally and is ready for the next user message.
            variant :end_turn, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionEndTurn }

            # The agent is idle waiting on one or more blocking user-input events (tool confirmation, custom tool result, etc.). Resolving all of them transitions the session back to running.
            variant :requires_action, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionRequiresAction }

            # The turn ended because the retry budget was exhausted (`max_iterations` hit or an error escalated to `retry_status: 'exhausted'`).
            variant :retries_exhausted, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionEndTurn, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRequiresAction, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRetriesExhausted)]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_THREAD_STATUS_IDLE = :"session.thread_status_idle"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
