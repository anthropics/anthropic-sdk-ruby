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
        #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubricParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubricParams] :rubric Rubric for grading the quality of an outcome.
        #
        #   @option args [Integer, nil] :max_iterations Eval→revision cycles before giving up. Default 3, max 20.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams]
        def self.new(type:, **args)
          case type.to_sym
          when :"user.message"
            Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams.new(**args)
          when :"user.define_outcome"
            Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams.new(**args)
          when :"system.message"
            Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsDeploymentInitialEventParams = Beta::BetaManagedAgentsDeploymentInitialEventParams
  end
end
