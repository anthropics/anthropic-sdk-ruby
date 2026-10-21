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
          #   Timestamp when the thread was created.
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
          #   @return [Symbol, :"session.thread_created"]
          required :type, const: :"session.thread_created"

          # @!attribute workflow_run_id
          #   Identifier of the workflow run that created the thread, or `null` for any other
          #   thread.
          #
          #   @return [String, nil]
          required :workflow_run_id, String, nil?: true

          # @!method initialize(id:, agent_name:, processed_at:, session_thread_id:, workflow_run_id:, type: :"session.thread_created")
          #   Emitted when a child thread is created. Written to the parent thread's output
          #   stream so clients observing the session see child creation.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent}
          #   for more details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param agent_name [String] Name of the callable agent the thread runs.
          #
          #   @param processed_at [Time] Timestamp when the thread was created.
          #
          #   @param session_thread_id [String] Public `sthr_` ID of the newly created thread.
          #
          #   @param workflow_run_id [String, nil] Identifier of the workflow run that created the thread, or `null` for any other
          #
          #   @param type [Symbol, :"session.thread_created"]
        end
      end
    end
  end
end
