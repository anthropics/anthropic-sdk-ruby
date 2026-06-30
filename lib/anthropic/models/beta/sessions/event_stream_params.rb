# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # @see Anthropic::Resources::Beta::Sessions::Events#stream_events
        class EventStreamParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute session_id
          #
          #   @return [String]
          required :session_id, String

          # @!attribute event_deltas
          #   When set, this connection also receives streaming deltas (`event_start`,
          #   `event_delta`) while an event is being produced, before the event itself
          #   arrives. Deltas are best-effort; when the final event is produced it carries the
          #   complete content. A model request that ends early (an error or interrupt)
          #   produces no final event — its terminal `span.model_request_end` closes the
          #   preview. Accepts one or more event types to preview and may be repeated:
          #   `agent.message` streams `content_delta` fragments; `agent.thinking` is
          #   start-only — a signal that the agent has begun extended thinking, concluded by
          #   the `agent.thinking` event itself. Only previews of the requested event types
          #   are sent.
          #
          #   @return [Array<Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeltaType>, nil]
          optional :event_deltas,
                   -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::BetaManagedAgentsDeltaType] }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
          optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

          # @!method initialize(session_id:, event_deltas: nil, betas: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::EventStreamParams} for more details.
          #
          #   @param session_id [String]
          #
          #   @param event_deltas [Array<Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeltaType>] When set, this connection also receives streaming deltas (`event_start`,
          #   `event\_
          #
          #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
