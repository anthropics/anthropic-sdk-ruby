# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsDeltaEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute delta
        #   One fragment of the previewed event. The delta type is named for the previewed
        #   event's field it streams into: agent.message events stream content_delta
        #   fragments, each a partial element of the content array.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsDeltaContent]
        required :delta, -> { Anthropic::Beta::BetaManagedAgentsDeltaContent }

        # @!attribute event_id
        #   The id of the event being previewed. Matches event.id on the corresponding
        #   event_start and the buffered event that reconciles the preview.
        #
        #   @return [String]
        required :event_id, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeltaEvent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeltaEvent::Type }

        # @!method initialize(delta:, event_id:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsDeltaEvent} for more details.
        #
        #   An incremental update to an event that is still being streamed. Deltas are
        #   best-effort and may stop early; when the buffered event with id == event_id is
        #   produced it carries the complete content. A model request that ends early (an
        #   error or interrupt) produces no buffered event — its terminal
        #   span.model_request_end closes the preview. Only sent on stream connections that
        #   opt in via event_deltas; never appears in event history.
        #
        #   @param delta [Anthropic::Models::Beta::BetaManagedAgentsDeltaContent] One fragment of the previewed event. The delta type is named for the previewed e
        #
        #   @param event_id [String] The id of the event being previewed. Matches event.id on the corresponding event
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeltaEvent::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsDeltaEvent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          EVENT_DELTA = :event_delta

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsDeltaEvent = Beta::BetaManagedAgentsDeltaEvent
  end
end
