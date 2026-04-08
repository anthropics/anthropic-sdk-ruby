# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserToolConfirmationEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute result
          #   UserToolConfirmationResult enum
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result]
          required :result,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result }

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
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Type }

          # @!attribute deny_message
          #   Optional message providing context for a 'deny' decision. Only allowed when
          #   result is 'deny'.
          #
          #   @return [String, nil]
          optional :deny_message, String, nil?: true

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          optional :processed_at, Time, nil?: true

          # @!method initialize(id:, result:, tool_use_id:, type:, deny_message: nil, processed_at: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent}
          #   for more details.
          #
          #   A tool confirmation event that approves or denies a pending tool execution.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param result [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result] UserToolConfirmationResult enum
          #
          #   @param tool_use_id [String] The id of the `agent.tool_use` or `agent.mcp_tool_use` event this result corresp
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Type]
          #
          #   @param deny_message [String, nil] Optional message providing context for a 'deny' decision. Only allowed when resu
          #
          #   @param processed_at [Time, nil] A timestamp in RFC 3339 format

          # UserToolConfirmationResult enum
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent#result
          module Result
            extend Anthropic::Internal::Type::Enum

            ALLOW = :allow
            DENY = :deny

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            USER_TOOL_CONFIRMATION = :"user.tool_confirmation"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
