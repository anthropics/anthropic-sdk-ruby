# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserToolConfirmationEventParams < Anthropic::Internal::Type::BaseModel
          # @!attribute result
          #   The confirmation result: 'allow' or 'deny'.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result]
          required :result,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result }

          # @!attribute tool_use_id
          #   The id of the `agent.tool_use` or `agent.mcp_tool_use` event this result
          #   corresponds to, which can be found in the last `session.status_idle`
          #   [event's](https://platform.claude.com/docs/en/api/beta/sessions/events/list#beta_managed_agents_session_requires_action.event_ids)
          #   `stop_reason.event_ids` field.
          #
          #   @return [String]
          required :tool_use_id, String

          # @!attribute type
          #
          #   @return [Symbol, :"user.tool_confirmation"]
          required :type, const: :"user.tool_confirmation"

          # @!attribute deny_message
          #   Optional message providing context for a 'deny' decision. Only allowed when
          #   result is 'deny'.
          #
          #   @return [String, nil]
          optional :deny_message, String, nil?: true

          # @!method initialize(result:, tool_use_id:, deny_message: nil, type: :"user.tool_confirmation")
          #   Parameters for confirming or denying a tool execution request.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams}
          #   for more details.
          #
          #   @param result [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result] The confirmation result: 'allow' or 'deny'.
          #
          #   @param tool_use_id [String] The id of the `agent.tool_use` or `agent.mcp_tool_use` event this result corresp
          #
          #   @param deny_message [String, nil] Optional message providing context for a 'deny' decision. Only allowed when resu
          #
          #   @param type [Symbol, :"user.tool_confirmation"]

          # The confirmation result: 'allow' or 'deny'.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams#result
          module Result
            extend Anthropic::Internal::Type::Enum

            ALLOW = :allow
            DENY = :deny

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
