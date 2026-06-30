# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsStartEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute event
        #   The previewed event's type and id. The event type determines which delta types
        #   the preview's event_delta events carry: agent.message events stream
        #   content_delta fragments; agent.thinking previews are start-only — no deltas
        #   follow, and the buffered agent.thinking with the same id concludes them.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview, Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview]
        required :event, union: -> { Anthropic::Beta::BetaManagedAgentsStartEventPreview }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsStartEvent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsStartEvent::Type }

        # @!method initialize(event:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsStartEvent} for more details.
        #
        #   Opens a preview of a buffered event. Carries the previewed event's type and id
        #   only. Followed by zero or more event_delta events with the same event id,
        #   normally concluded by the buffered event carrying that id. If the producing
        #   model request ends without that event (an error or interrupt mid-stream), its
        #   terminal span.model_request_end closes the preview. Only sent on stream
        #   connections that opt in via event_deltas; never appears in event history.
        #
        #   @param event [Anthropic::Models::Beta::BetaManagedAgentsAgentMessagePreview, Anthropic::Models::Beta::BetaManagedAgentsAgentThinkingPreview] The previewed event's type and id. The event type determines which delta types t
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsStartEvent::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsStartEvent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          EVENT_START = :event_start

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsStartEvent = Beta::BetaManagedAgentsStartEvent
  end
end
