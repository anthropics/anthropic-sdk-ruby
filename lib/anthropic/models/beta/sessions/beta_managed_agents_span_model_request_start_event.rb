# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSpanModelRequestStartEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent::Type }

          # @!method initialize(id:, processed_at:, type:)
          #   Emitted when a model request is initiated by the agent.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SPAN_MODEL_REQUEST_START = :"span.model_request_start"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
