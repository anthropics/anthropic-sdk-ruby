# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Sessions
        class Events
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::EventListParams} for more details.
          #
          # List Events
          #
          # @overload list(session_id, created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, limit: nil, order: nil, page: nil, types: nil, betas: nil, request_options: {})
          #
          # @param session_id [String] Path param: Path parameter session_id
          #
          # @param created_at_gt [Time] Query param: Return events created after this time (exclusive).
          #
          # @param created_at_gte [Time] Query param: Return events created at or after this time (inclusive).
          #
          # @param created_at_lt [Time] Query param: Return events created before this time (exclusive).
          #
          # @param created_at_lte [Time] Query param: Return events created at or before this time (inclusive).
          #
          # @param limit [Integer] Query param: Query parameter for limit
          #
          # @param order [Symbol, Anthropic::Models::Beta::Sessions::EventListParams::Order] Query param: Sort direction for results, ordered by created_at. Defaults to asc
          #
          # @param page [String] Query param: Opaque pagination cursor from a previous response's next_page.
          #
          # @param types [Array<String>] Query param: Filter by event type. Values match the `type` field on returned eve
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent>]
          #
          # @see Anthropic::Models::Beta::Sessions::EventListParams
          def list(session_id, params = {})
            query_params =
              [
                :created_at_gt,
                :created_at_gte,
                :created_at_lt,
                :created_at_lte,
                :limit,
                :order,
                :page,
                :types
              ]
            parsed, options = Anthropic::Beta::Sessions::EventListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/sessions/%1$s/events?beta=true", session_id],
              query: query.transform_keys(
                created_at_gt: "created_at[gt]",
                created_at_gte: "created_at[gte]",
                created_at_lt: "created_at[lt]",
                created_at_lte: "created_at[lte]"
              ),
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Send Events
          #
          # @overload send_(session_id, events:, betas: nil, request_options: {})
          #
          # @param session_id [String] Path param: Path parameter session_id
          #
          # @param events [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams>] Body param: Events to send to the `session`.
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSendSessionEvents]
          #
          # @see Anthropic::Models::Beta::Sessions::EventSendParams
          def send_(session_id, params)
            parsed, options = Anthropic::Beta::Sessions::EventSendParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/sessions/%1$s/events?beta=true", session_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # Stream Events
          #
          # @overload stream_events(session_id, betas: nil, request_options: {})
          #
          # @param session_id [String] Path parameter session_id
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::Stream<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent>]
          #
          # @see Anthropic::Models::Beta::Sessions::EventStreamParams
          def stream_events(session_id, params = {})
            parsed, options = Anthropic::Beta::Sessions::EventStreamParams.dump_request(params)
            @client.request(
              method: :get,
              path: ["v1/sessions/%1$s/events/stream?beta=true", session_id],
              headers: {
                "accept" => "text/event-stream",
                "accept-encoding" => "identity",
                **parsed
              }.transform_keys(
                betas: "anthropic-beta"
              ),
              stream: Anthropic::Internal::Stream,
              model: Anthropic::Beta::Sessions::BetaManagedAgentsStreamSessionEvents,
              options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
