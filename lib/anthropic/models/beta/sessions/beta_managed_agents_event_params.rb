# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # Union type for event parameters that can be sent to a session.
        module BetaManagedAgentsEventParams
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Parameters for sending a user message to the session.
          variant :"user.message", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams }

          # Parameters for sending an interrupt to pause the agent.
          variant :"user.interrupt", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams }

          # Parameters for confirming or denying a tool execution request.
          variant :"user.tool_confirmation",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams }

          # Parameters for providing the result of a custom tool execution.
          variant :"user.custom_tool_result",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams }

          # Parameters for defining an outcome the agent should work toward. The agent begins work on receipt.
          variant :"user.define_outcome",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams }

          # Parameters for providing the result of an agent-toolset tool execution. Only valid on `self_hosted` environments, where sandbox-routed tools are executed by the client rather than the server.
          variant :"user.tool_result", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams }

          # Privileged context for the accompanying turn and all subsequent turns, appended to the session's system context as a `role: "system"` turn rather than replacing the top-level system prompt. At most one per request: it must be the final event and immediately follow the `user.message`, `user.tool_result`, or `user.custom_tool_result` it accompanies. Only supported on models that accept mid-conversation system messages.
          variant :"system.message", -> { Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams }

          module Type
            extend Anthropic::Internal::Type::Enum

            USER_MESSAGE = :"user.message"
            USER_INTERRUPT = :"user.interrupt"
            USER_TOOL_CONFIRMATION = :"user.tool_confirmation"
            USER_CUSTOM_TOOL_RESULT = :"user.custom_tool_result"
            USER_DEFINE_OUTCOME = :"user.define_outcome"
            USER_TOOL_RESULT = :"user.tool_result"
            SYSTEM_MESSAGE = :"system.message"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::BetaManagedAgentsEventParams} for more
          # details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock>, Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultBlock>, Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>] :content Array of content blocks for the user message.
          #
          #   @option args [String, nil] :session_thread_id If absent, interrupts every non-archived thread in a multiagent session (or the
          #
          #   @option args [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::Result] :result UserToolConfirmationResult enum
          #
          #   @option args [String] :tool_use_id The id of the `agent.tool_use` or `agent.mcp_tool_use` event this result corresp
          #
          #   @option args [String, nil] :deny_message Optional message providing context for a 'deny' decision. Only allowed when resu
          #
          #   @option args [String] :custom_tool_use_id The id of the `agent.custom_tool_use` event this result corresponds to, which ca
          #
          #   @option args [Boolean, nil] :is_error Whether the tool execution resulted in an error.
          #
          #   @option args [String] :description What the agent should produce. This is the task specification.
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubricParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubricParams] :rubric Rubric for grading the quality of an outcome.
          #
          #   @option args [Integer, nil] :max_iterations Eval→revision cycles before giving up. Default 3, max 20.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams]
          def self.new(type:, **args)
            case type.to_sym
            when :"user.message"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams.new(**args)
            when :"user.interrupt"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams.new(**args)
            when :"user.tool_confirmation"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams.new(**args)
            when :"user.custom_tool_result"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams.new(**args)
            when :"user.define_outcome"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams.new(**args)
            when :"user.tool_result"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams.new(**args)
            when :"system.message"
              Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
