# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadStatusRescheduledEvent < Anthropic::Internal::Type::BaseModel
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
          #   Public sthr\_ ID of the thread that is retrying.
          #
          #   @return [String]
          required :session_thread_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent::Type }

          # @!method initialize(id:, agent_name:, processed_at:, session_thread_id:, type:)
          #   A session thread hit a transient error and is retrying automatically. Emitted on
          #   the thread's own stream and cross-posted to the primary stream for child
          #   threads.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param agent_name [String] Name of the agent the thread runs.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param session_thread_id [String] Public sthr\_ ID of the thread that is retrying.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_THREAD_STATUS_RESCHEDULED = :"session.thread_status_rescheduled"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
