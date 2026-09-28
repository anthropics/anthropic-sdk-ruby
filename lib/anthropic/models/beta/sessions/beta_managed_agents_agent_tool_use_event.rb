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
          #   Timestamp when this event was processed.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::Type }

          # @!attribute evaluated_permission
          #   The evaluated permission policy for this tool invocation.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission, nil]
          optional :evaluated_permission,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission }

          # @!attribute evaluation
          #   Which resolved permission_policy produced evaluated_permission: always_allow,
          #   always_ask, or auto (with the server's per-invocation judgement). Absent only
          #   when the server refused the call before any policy applied (for example, the
          #   named tool is not enabled in the session); such a refusal has
          #   evaluated_permission deny. An event recorded before this field existed reads as
          #   the arm its evaluated_permission implies (always_allow for allow, always_ask for
          #   ask).
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAllow, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAsk, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto, nil]
          optional :evaluation, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation }

          # @!attribute session_thread_id
          #   When set, this event was cross-posted from a subagent's thread to surface its
          #   permission request on the primary thread's stream. Empty on the thread's own
          #   events. Informational only: the server routes the matching
          #   `user.tool_confirmation` or `user.tool_result` by `tool_use_id`, so clients do
          #   not send it back.
          #
          #   @return [String, nil]
          optional :session_thread_id, String, nil?: true

          # @!method initialize(id:, input:, name:, processed_at:, type:, evaluated_permission: nil, evaluation: nil, session_thread_id: nil)
          #   Event emitted when the agent invokes a built-in agent tool.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent} for more
          #   details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param input [Hash{Symbol=>Object}] Input parameters for the tool call.
          #
          #   @param name [String] Name of the agent tool being used.
          #
          #   @param processed_at [Time] Timestamp when this event was processed.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent::Type]
          #
          #   @param evaluated_permission [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentEvaluatedPermission] The evaluated permission policy for this tool invocation.
          #
          #   @param evaluation [Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAllow, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAsk, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto] Which resolved permission_policy produced evaluated_permission: always_allow, al
          #
          #   @param session_thread_id [String, nil] When set, this event was cross-posted from a subagent's thread to surface its pe

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            AGENT_TOOL_USE = :"agent.tool_use"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
