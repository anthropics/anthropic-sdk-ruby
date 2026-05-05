# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadStatusTerminatedEvent < Anthropic::Internal::Type::BaseModel
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
          #   Public sthr\_ ID of the thread that terminated.
          #
          #   @return [String]
          required :session_thread_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent::Type }

          # @!method initialize(id:, agent_name:, processed_at:, session_thread_id:, type:)
          #   A session thread has terminated and will accept no further input. Emitted on the
          #   thread's own stream and cross-posted to the primary stream for child threads.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param agent_name [String] Name of the agent the thread runs.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param session_thread_id [String] Public sthr\_ ID of the thread that terminated.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_THREAD_STATUS_TERMINATED = :"session.thread_status_terminated"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
