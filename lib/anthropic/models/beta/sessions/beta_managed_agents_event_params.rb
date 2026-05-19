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

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams)]
        end
      end
    end
  end
end
