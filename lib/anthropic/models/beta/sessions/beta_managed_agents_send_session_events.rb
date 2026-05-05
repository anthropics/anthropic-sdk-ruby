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
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent>, nil]
          optional :data,
                   -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents::Data] }

          # @!method initialize(data: nil)
          #   Events that were successfully sent to the session.
          #
          #   @param data [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent>] Sent events

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

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent)]
          end
        end
      end
    end
  end
end
