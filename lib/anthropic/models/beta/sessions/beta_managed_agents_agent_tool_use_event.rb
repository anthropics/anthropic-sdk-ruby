# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentToolUseEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute input
          #   Input parameters for the tool call.
          #
          #   @return [Hash{Symbol=>Object}]
          required :input, Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]

          # @!attribute name
          #   Name of the agent tool being used.
          #
          #   @return [String]
          required :name, String

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::Type }

          # @!attribute evaluated_permission
          #   AgentEvaluatedPermission enum
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::EvaluatedPermission, nil]
          optional :evaluated_permission,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::EvaluatedPermission }

          # @!attribute session_thread_id
          #   When set, this event was cross-posted from a subagent's thread to surface its
          #   permission request on the primary thread's stream. Empty on the thread's own
          #   events. Echo this on a `user.tool_confirmation` event to route the approval
          #   back.
          #
          #   @return [String, nil]
          optional :session_thread_id, String, nil?: true

          # @!method initialize(id:, input:, name:, processed_at:, type:, evaluated_permission: nil, session_thread_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent} for more
          #   details.
          #
          #   Event emitted when the agent invokes a built-in agent tool.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param input [Hash{Symbol=>Object}] Input parameters for the tool call.
          #
          #   @param name [String] Name of the agent tool being used.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::Type]
          #
          #   @param evaluated_permission [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::EvaluatedPermission] AgentEvaluatedPermission enum
          #
          #   @param session_thread_id [String, nil] When set, this event was cross-posted from a subagent's thread to surface its pe

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT_TOOL_USE = :"agent.tool_use"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # AgentEvaluatedPermission enum
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent#evaluated_permission
          module EvaluatedPermission
            extend Anthropic::Internal::Type::Enum

            ALLOW = :allow
            ASK = :ask
            DENY = :deny

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
