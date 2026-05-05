# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # @see Anthropic::Resources::Beta::Sessions::Threads#retrieve
        class BetaManagedAgentsSessionThread < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this thread.
          #
          #   @return [String]
          required :id, String

          # @!attribute agent
          #   Resolved `agent` definition for a single `session_thread`. Snapshot of the agent
          #   at thread creation time. The multiagent roster is not repeated here; read it
          #   from `Session.agent`.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadAgent]
          required :agent, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadAgent }

          # @!attribute archived_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          required :archived_at, Time, nil?: true

          # @!attribute created_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute parent_thread_id
          #   Parent thread that spawned this thread. Null for the primary thread.
          #
          #   @return [String, nil]
          required :parent_thread_id, String, nil?: true

          # @!attribute session_id
          #   The session this thread belongs to.
          #
          #   @return [String]
          required :session_id, String

          # @!attribute stats
          #   Timing statistics for a session thread.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStats, nil]
          required :stats, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStats }, nil?: true

          # @!attribute status
          #   SessionThreadStatus enum
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatus]
          required :status, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type }

          # @!attribute updated_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute usage
          #   Cumulative token usage for a session thread across all turns.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadUsage, nil]
          required :usage, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadUsage }, nil?: true

          # @!method initialize(id:, agent:, archived_at:, created_at:, parent_thread_id:, session_id:, stats:, status:, type:, updated_at:, usage:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread} for more
          #   details.
          #
          #   An execution thread within a `session`. Each session has one primary thread plus
          #   zero or more child threads spawned by the coordinator.
          #
          #   @param id [String] Unique identifier for this thread.
          #
          #   @param agent [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadAgent] Resolved `agent` definition for a single `session_thread`. Snapshot of the agent
          #
          #   @param archived_at [Time, nil] A timestamp in RFC 3339 format
          #
          #   @param created_at [Time] A timestamp in RFC 3339 format
          #
          #   @param parent_thread_id [String, nil] Parent thread that spawned this thread. Null for the primary thread.
          #
          #   @param session_id [String] The session this thread belongs to.
          #
          #   @param stats [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStats, nil] Timing statistics for a session thread.
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatus] SessionThreadStatus enum
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread::Type]
          #
          #   @param updated_at [Time] A timestamp in RFC 3339 format
          #
          #   @param usage [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadUsage, nil] Cumulative token usage for a session thread across all turns.

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_THREAD = :session_thread

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
