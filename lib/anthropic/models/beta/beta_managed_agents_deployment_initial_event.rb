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

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock>, Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>] :content Array of content blocks for the user message.
        #
        #   @option args [String] :description What the agent should produce. This is the task specification.
        #
        #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric] :rubric Rubric for grading the quality of an outcome.
        #
        #   @option args [Integer, nil] :max_iterations Eval→revision cycles before giving up. Default 3, max 20.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserMessageEvent, Anthropic::Models::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent, Anthropic::Models::Beta::BetaManagedAgentsDeploymentSystemMessageEvent]
        def self.new(type:, **args)
          case type.to_sym
          when :"user.message"
            Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent.new(**args)
          when :"user.define_outcome"
            Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent.new(**args)
          when :"system.message"
            Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsDeploymentInitialEvent = Beta::BetaManagedAgentsDeploymentInitialEvent
  end
end
