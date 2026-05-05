# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserInterruptEventParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type }

          # @!attribute session_thread_id
          #   If absent, interrupts every non-archived thread in a multiagent session (or the
          #   primary alone in a single-agent session). If present, interrupts only the named
          #   thread.
          #
          #   @return [String, nil]
          optional :session_thread_id, String, nil?: true

          # @!method initialize(type:, session_thread_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams}
          #   for more details.
          #
          #   Parameters for sending an interrupt to pause the agent.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::Type]
          #
          #   @param session_thread_id [String, nil] If absent, interrupts every non-archived thread in a multiagent session (or the

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams#type
          module Type
            extend Anthropic::Internal::Type::Enum

            USER_INTERRUPT = :"user.interrupt"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
