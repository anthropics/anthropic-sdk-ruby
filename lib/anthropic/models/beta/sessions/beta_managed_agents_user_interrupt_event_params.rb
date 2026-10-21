# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserInterruptEventParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :"user.interrupt"]
          required :type, const: :"user.interrupt"

          # @!attribute session_thread_id
          #   If absent, interrupts every non-archived thread in a multiagent session (or the
          #   primary alone in a single-agent session). If present, interrupts only the named
          #   thread.
          #
          #   @return [String, nil]
          optional :session_thread_id, String, nil?: true

          # @!method initialize(session_thread_id: nil, type: :"user.interrupt")
          #   Parameters for sending an interrupt to pause the agent.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams}
          #   for more details.
          #
          #   @param session_thread_id [String, nil] If absent, interrupts every non-archived thread in a multiagent session (or the
          #
          #   @param type [Symbol, :"user.interrupt"]
        end
      end
    end
  end
end
