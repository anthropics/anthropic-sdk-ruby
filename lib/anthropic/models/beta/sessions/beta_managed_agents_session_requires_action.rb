# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionRequiresAction < Anthropic::Internal::Type::BaseModel
          # @!attribute event_ids
          #   The ids of events the agent is blocked on. Resolving fewer than all re-emits
          #   `session.status_idle` with the remainder.
          #
          #   @return [Array<String>]
          required :event_ids, Anthropic::Internal::Type::ArrayOf[String]

          # @!attribute type
          #
          #   @return [Symbol, :requires_action]
          required :type, const: :requires_action

          # @!method initialize(event_ids:, type: :requires_action)
          #   The agent is idle waiting on one or more blocking user-input events (tool
          #   confirmation, custom tool result, etc.). Resolving all of them transitions the
          #   session back to running.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionRequiresAction} for
          #   more details.
          #
          #   @param event_ids [Array<String>] The ids of events the agent is blocked on. Resolving fewer than all re-emits `se
          #
          #   @param type [Symbol, :requires_action]
        end
      end
    end
  end
end
