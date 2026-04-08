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
          #   Token usage for a single model request.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelUsage]
          required :model_usage, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage }

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent::Type }

          # @!method initialize(id:, is_error:, model_request_start_id:, model_usage:, processed_at:, type:)
          #   Emitted when a model request completes.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param is_error [Boolean, nil] Whether the model request resulted in an error.
          #
          #   @param model_request_start_id [String] The id of the corresponding `span.model_request_start` event.
          #
          #   @param model_usage [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelUsage] Token usage for a single model request.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SPAN_MODEL_REQUEST_END = :"span.model_request_end"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
