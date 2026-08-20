# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # @see Anthropic::Resources::Beta::Sessions::Events#send_
        class BetaManagedAgentsSendSessionEvents < Anthropic::Internal::Type::BaseModel
          # @!attribute data
          #   Sent events
          #
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::BetaManagedAgentsUserToolResultEvent, Anthropic::Models::Beta::BetaManagedAgentsSystemMessageEvent>, nil]
          optional :data,
                   -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data] }

          # @!method initialize(data: nil)
          #   Events that were successfully sent to the session.
          #
          #   @param data [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::BetaManagedAgentsUserToolResultEvent, Anthropic::Models::Beta::BetaManagedAgentsSystemMessageEvent>] Sent events

          # Union type for events that can be sent to a session.
          module Data
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # A user message event in the session conversation.
            variant :"user.message", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent }

            # An interrupt event that pauses agent execution and returns control to the user.
            variant :"user.interrupt", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent }

            # A tool confirmation event that approves or denies a pending tool execution.
            variant :"user.tool_confirmation",
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent }

            # Event sent by the client providing the result of a custom tool execution.
            variant :"user.custom_tool_result",
                    -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent }

            # Echo of a `user.define_outcome` input event. Carries the server-generated `outcome_id` that subsequent `span.outcome_evaluation_*` events reference.
            variant :"user.define_outcome", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent }

            # Event sent by the client providing the result of an agent-toolset tool execution. Only valid on `self_hosted` environments, where sandbox-routed tools are executed by the client rather than the server.
            variant :"user.tool_result", -> { Anthropic::Beta::BetaManagedAgentsUserToolResultEvent }

            # A mid-conversation system message event. Carries system-role content that is appended to the session as a `role: "system"` turn.
            variant :"system.message", -> { Anthropic::Beta::BetaManagedAgentsSystemMessageEvent }

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
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::BetaManagedAgentsUserToolResultEvent, Anthropic::Models::Beta::BetaManagedAgentsSystemMessageEvent)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data}
            # for more details.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :id Unique identifier for this event.
            #
            #   @option args [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock>, Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultBlock>, Array<Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock>] :content Array of content blocks comprising the user message.
            #
            #   @option args [Time, nil, Time] :processed_at A timestamp in RFC 3339 format
            #
            #   @option args [String, nil] :session_thread_id If absent, interrupts every non-archived thread in a multiagent session (or the
            #
            #   @option args [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent::Result] :result UserToolConfirmationResult enum
            #
            #   @option args [String] :tool_use_id The id of the `agent.tool_use` or `agent.mcp_tool_use` event this result corresp
            #
            #   @option args [String, nil] :deny_message Optional message providing context for a 'deny' decision. Only allowed when resu
            #
            #   @option args [String] :custom_tool_use_id The id of the `agent.custom_tool_use` event this result corresponds to, which ca
            #
            #   @option args [Boolean, nil] :is_error Whether the tool execution resulted in an error.
            #
            #   @option args [String] :description What the agent should produce. Copied from the input event.
            #
            #   @option args [Integer, nil] :max_iterations Evaluate-then-revise cycles before giving up. Default 3, max 20.
            #
            #   @option args [String] :outcome_id Server-generated `outc_` ID for this outcome. Referenced by `span.outcome_evalua
            #
            #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric] :rubric Rubric for grading the quality of an outcome.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::BetaManagedAgentsUserToolResultEvent, Anthropic::Models::Beta::BetaManagedAgentsSystemMessageEvent]
            def self.new(type:, **args)
              case type.to_sym
              when :"user.message"
                Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEvent.new(**args)
              when :"user.interrupt"
                Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent.new(**args)
              when :"user.tool_confirmation"
                Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent.new(**args)
              when :"user.custom_tool_result"
                Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent.new(**args)
              when :"user.define_outcome"
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent.new(**args)
              when :"user.tool_result"
                Anthropic::Beta::BetaManagedAgentsUserToolResultEvent.new(**args)
              when :"system.message"
                Anthropic::Beta::BetaManagedAgentsSystemMessageEvent.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end
        end
      end
    end
  end
end
