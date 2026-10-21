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
          #   Timestamp of the status transition.
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
          #   @return [Symbol, :"session.thread_status_terminated"]
          required :type, const: :"session.thread_status_terminated"

          # @!method initialize(id:, agent_name:, processed_at:, session_thread_id:, type: :"session.thread_status_terminated")
          #   A session thread has terminated and will accept no further input. Emitted on the
          #   thread's own stream and cross-posted to the primary stream for child threads.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param agent_name [String] Name of the agent the thread runs.
          #
          #   @param processed_at [Time] Timestamp of the status transition.
          #
          #   @param session_thread_id [String] Public sthr\_ ID of the thread that terminated.
          #
          #   @param type [Symbol, :"session.thread_status_terminated"]
        end
      end
    end
  end
end
