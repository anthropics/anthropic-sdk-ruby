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
          #   Resolved agent definition for this thread. Snapshot of the agent at thread
          #   creation time.
          #
          #   @return [Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent, Anthropic::Models::Beta::BetaManagedAgentsAdvisor, Anthropic::Models::Beta::Sessions::BetaManagedAgentsInlineAgent]
          required :agent, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Agent }

          # @!attribute archived_at
          #   When the thread was archived. Null if not archived.
          #
          #   @return [Time, nil]
          required :archived_at, Time, nil?: true

          # @!attribute created_at
          #   When the thread was created.
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
          #   Timing statistics for this thread. Null until the thread's first status
          #   transition.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStats, nil]
          required :stats, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStats }, nil?: true

          # @!attribute status
          #   Current execution status of the thread.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatus]
          required :status, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadStatus }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread::Type }

          # @!attribute updated_at
          #   When the thread was last updated.
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute usage
          #   Cumulative token usage for this thread. Null until the thread's first idle
          #   transition.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadUsage, nil]
          required :usage, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadUsage }, nil?: true

          # @!attribute workflow_run_id
          #   Identifier of the workflow run that created the thread, or `null` for any other
          #   thread.
          #
          #   @return [String, nil]
          required :workflow_run_id, String, nil?: true

          # @!method initialize(id:, agent:, archived_at:, created_at:, parent_thread_id:, session_id:, stats:, status:, type:, updated_at:, usage:, workflow_run_id:)
          #   An execution thread within a `session`. Each session has one primary thread plus
          #   zero or more child threads.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread} for more
          #   details.
          #
          #   @param id [String] Unique identifier for this thread.
          #
          #   @param agent [Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent, Anthropic::Models::Beta::BetaManagedAgentsAdvisor, Anthropic::Models::Beta::Sessions::BetaManagedAgentsInlineAgent] Resolved agent definition for this thread. Snapshot of the agent at thread creat
          #
          #   @param archived_at [Time, nil] When the thread was archived. Null if not archived.
          #
          #   @param created_at [Time] When the thread was created.
          #
          #   @param parent_thread_id [String, nil] Parent thread that spawned this thread. Null for the primary thread.
          #
          #   @param session_id [String] The session this thread belongs to.
          #
          #   @param stats [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStats, nil] Timing statistics for this thread. Null until the thread's first status transiti
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatus] Current execution status of the thread.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread::Type]
          #
          #   @param updated_at [Time] When the thread was last updated.
          #
          #   @param usage [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadUsage, nil] Cumulative token usage for this thread. Null until the thread's first idle trans
          #
          #   @param workflow_run_id [String, nil] Identifier of the workflow run that created the thread, or `null` for any other

          # Resolved agent definition for this thread. Snapshot of the agent at thread
          # creation time.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread#agent
          module Agent
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Resolved `agent` definition for a single `session_thread`. Snapshot of the agent at thread creation time. The multiagent roster is not repeated here; read it from `Session.agent`.
            variant :agent, -> { Anthropic::Beta::BetaManagedAgentsSessionThreadAgent }

            # Platform advisor roster entry: a model the session's primary thread may consult mid-turn.
            variant :advisor, -> { Anthropic::Beta::BetaManagedAgentsAdvisor }

            # An agent that has no Agent resource, and so no `id` or `version`. It is defined inline, in a workflow run's plan or when a session thread is spawned, and is not saved.
            variant :inline, -> { Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent }

            module Type
              extend Anthropic::Internal::Type::Enum

              AGENT = :agent
              ADVISOR = :advisor
              INLINE = :inline

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent, Anthropic::Models::Beta::BetaManagedAgentsAdvisor, Anthropic::Models::Beta::Sessions::BetaManagedAgentsInlineAgent)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThread::Agent::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :id
            #
            #   @option args [String, nil] :description
            #
            #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsMCPServerURLDefinition>] :mcp_servers
            #
            #   @option args [Anthropic::Models::Beta::BetaManagedAgentsModelConfig, String] :model Model identifier and configuration.
            #
            #   @option args [String] :name The name that the agent's definition gave, or one that the server assigned.
            #
            #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsAnthropicSkill, Anthropic::Models::Beta::BetaManagedAgentsCustomSkill>] :skills
            #
            #   @option args [String, nil] :system_
            #
            #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401, Anthropic::Models::Beta::BetaManagedAgentsMCPToolset, Anthropic::Models::Beta::BetaManagedAgentsCustomTool>] :tools
            #
            #   @option args [Integer] :version
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent, Anthropic::Models::Beta::BetaManagedAgentsAdvisor, Anthropic::Models::Beta::Sessions::BetaManagedAgentsInlineAgent]
            def self.new(type:, **args)
              case type.to_sym
              when :agent
                Anthropic::Beta::BetaManagedAgentsSessionThreadAgent.new(**args)
              when :advisor
                Anthropic::Beta::BetaManagedAgentsAdvisor.new(**args)
              when :inline
                Anthropic::Beta::Sessions::BetaManagedAgentsInlineAgent.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

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
