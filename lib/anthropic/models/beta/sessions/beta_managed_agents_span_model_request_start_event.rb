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
          #   Timestamp when the model request started.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :"span.model_request_start"]
          required :type, const: :"span.model_request_start"

          # @!method initialize(id:, processed_at:, type: :"span.model_request_start")
          #   Emitted when a model request is initiated by the agent.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] Timestamp when the model request started.
          #
          #   @param type [Symbol, :"span.model_request_start"]
        end
      end
    end
  end
end
