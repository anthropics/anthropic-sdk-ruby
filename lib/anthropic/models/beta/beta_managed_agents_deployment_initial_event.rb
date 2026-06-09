# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # An event sent to a session immediately after it is created. Supports
      # `user.message`, `user.define_outcome`, and `system.message`.
      module BetaManagedAgentsDeploymentInitialEvent
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # A user message sent to the session.
        variant :"user.message", -> { Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent }

        # An outcome the agent should work toward. The agent begins work on receipt.
        variant :"user.define_outcome", -> { Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent }

        # Privileged context for the accompanying turn and all subsequent turns, appended to the session's system context as a `role: "system"` turn rather than replacing the top-level system prompt.
        variant :"system.message", -> { Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserMessageEvent, Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent, Anthropic::Models::Beta::BetaManagedAgentsDeploymentSystemMessageEvent)]
      end
    end

    BetaManagedAgentsDeploymentInitialEvent = Beta::BetaManagedAgentsDeploymentInitialEvent
  end
end
