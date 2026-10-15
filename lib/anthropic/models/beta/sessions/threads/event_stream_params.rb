# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        module Threads
          # @see Anthropic::Resources::Beta::Sessions::Threads::Events#stream_events
          class EventStreamParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute session_id
            #
            #   @return [String]
            required :session_id, String

            # @!attribute thread_id
            #
            #   @return [String]
            required :thread_id, String

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
            #   This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
            #   header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!attribute workspace_id
            #   Optional header to select the Workspace for this request. The value is a
            #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
            #
            #   Only needed for credentials that can act on more than one Workspace. A
            #   credential that belongs to a specific Workspace may omit it; if sent, it must
            #   match that Workspace.
            #
            #   @return [String, nil]
            optional :workspace_id, String

            # @!method initialize(session_id:, thread_id:, event_deltas: nil, betas: nil, workspace_id: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Sessions::Threads::EventStreamParams} for more
            #   details.
            #
            #   @param session_id [String]
            #
            #   @param thread_id [String]
            #
            #   @param event_deltas [Array<Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeltaType>] When set, this connection also receives streaming deltas (`event_start`,
            #   `event\_
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `managed-agents-2026-04-01` in this
            #
            #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
