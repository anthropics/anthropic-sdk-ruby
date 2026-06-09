# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # An event sent to a session immediately after it is created. Supports
      # `user.message`, `user.define_outcome`, and `system.message`.
      module BetaManagedAgentsDeploymentInitialEventParams
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # Parameters for sending a user message to the session.
        variant :"user.message", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams }

        # Parameters for defining an outcome the agent should work toward. The agent begins work on receipt.
        variant :"user.define_outcome",
                -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams }

        # Privileged context for the accompanying turn and all subsequent turns, appended to the session's system context as a `role: "system"` turn rather than replacing the top-level system prompt. At most one per request: it must be the final event and immediately follow the `user.message`, `user.tool_result`, or `user.custom_tool_result` it accompanies. Only supported on models that accept mid-conversation system messages.
        variant :"system.message", -> { Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams)]
      end
    end

    BetaManagedAgentsDeploymentInitialEventParams = Beta::BetaManagedAgentsDeploymentInitialEventParams
  end
end
