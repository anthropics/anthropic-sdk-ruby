# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserInterruptEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::Type }

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time, nil]
          optional :processed_at, Time, nil?: true

          # @!attribute session_thread_id
          #   If absent, interrupts every non-archived thread in a multiagent session (or the
          #   primary alone in a single-agent session). If present, interrupts only the named
          #   thread.
          #
          #   @return [String, nil]
          optional :session_thread_id, String, nil?: true

          # @!method initialize(id:, type:, processed_at: nil, session_thread_id: nil)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent} for
          #   more details.
          #
          #   An interrupt event that pauses agent execution and returns control to the user.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent::Type]
          #
          #   @param processed_at [Time, nil] A timestamp in RFC 3339 format
          #
          #   @param session_thread_id [String, nil] If absent, interrupts every non-archived thread in a multiagent session (or the

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent#type
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
