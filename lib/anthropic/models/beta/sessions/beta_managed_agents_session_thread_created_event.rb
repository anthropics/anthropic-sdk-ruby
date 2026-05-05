# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadCreatedEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute agent_name
          #   Name of the callable agent the thread runs.
          #
          #   @return [String]
          required :agent_name, String

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute session_thread_id
          #   Public `sthr_` ID of the newly created thread.
          #
          #   @return [String]
          required :session_thread_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent::Type }

          # @!method initialize(id:, agent_name:, processed_at:, session_thread_id:, type:)
          #   Emitted when a subagent is spawned as a new thread. Written to the parent
          #   thread's output stream so clients observing the session see child creation.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param agent_name [String] Name of the callable agent the thread runs.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param session_thread_id [String] Public `sthr_` ID of the newly created thread.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_THREAD_CREATED = :"session.thread_created"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
