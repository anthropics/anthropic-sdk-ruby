# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSpanModelRequestEndEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute is_error
          #   Whether the model request resulted in an error.
          #
          #   @return [Boolean, nil]
          required :is_error, Anthropic::Internal::Type::Boolean, nil?: true

          # @!attribute model_request_start_id
          #   The id of the corresponding `span.model_request_start` event.
          #
          #   @return [String]
          required :model_request_start_id, String

          # @!attribute model_usage
          #   Token usage for this model request.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelUsage]
          required :model_usage, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage }

          # @!attribute processed_at
          #   Timestamp when the model request completed.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :"span.model_request_end"]
          required :type, const: :"span.model_request_end"

          # @!method initialize(id:, is_error:, model_request_start_id:, model_usage:, processed_at:, type: :"span.model_request_end")
          #   Emitted when a model request completes.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param is_error [Boolean, nil] Whether the model request resulted in an error.
          #
          #   @param model_request_start_id [String] The id of the corresponding `span.model_request_start` event.
          #
          #   @param model_usage [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelUsage] Token usage for this model request.
          #
          #   @param processed_at [Time] Timestamp when the model request completed.
          #
          #   @param type [Symbol, :"span.model_request_end"]
        end
      end
    end
  end
end
