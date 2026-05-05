# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Sessions
        class Threads
          class Events
            # List Session Thread Events
            #
            # @overload list(thread_id, session_id:, limit: nil, page: nil, betas: nil, request_options: {})
            #
            # @param thread_id [String] Path param: Path parameter thread_id
            #
            # @param session_id [String] Path param: Path parameter session_id
            #
            # @param limit [Integer] Query param: Query parameter for limit
            #
            # @param page [String] Query param: Query parameter for page
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent>]
            #
            # @see Anthropic::Models::Beta::Sessions::Threads::EventListParams
            def list(thread_id, params)
              query_params = [:limit, :page]
              parsed, options = Anthropic::Beta::Sessions::Threads::EventListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              session_id =
                parsed.delete(:session_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :get,
                path: ["v1/sessions/%1$s/threads/%2$s/events?beta=true", session_id, thread_id],
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent,
                options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
              )
            end

            # Stream Session Thread Events
            #
            # @overload stream_events(thread_id, session_id:, betas: nil, request_options: {})
            #
            # @param thread_id [String] Path param: Path parameter thread_id
            #
            # @param session_id [String] Path param: Path parameter session_id
            #
            # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::Stream<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserInterruptEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentCustomToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMessageEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThinkingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentMCPToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolUseEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolResultEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageReceivedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadMessageSentEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentThreadContextCompactedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionErrorEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRescheduledEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadCreatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestStartEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelRequestEndEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionDeletedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRunningEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusIdleEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusTerminatedEvent, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionThreadStatusRescheduledEvent>]
            #
            # @see Anthropic::Models::Beta::Sessions::Threads::EventStreamParams
            def stream_events(thread_id, params)
              parsed, options = Anthropic::Beta::Sessions::Threads::EventStreamParams.dump_request(params)
              session_id =
                parsed.delete(:session_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :get,
                path: ["v1/sessions/%1$s/threads/%2$s/stream?beta=true", session_id, thread_id],
                headers: {
                  "accept" => "text/event-stream",
                  "accept-encoding" => "identity",
                  **parsed
                }.transform_keys(
                  betas: "anthropic-beta"
                ),
                stream: Anthropic::Internal::Stream,
                model: Anthropic::Beta::Sessions::BetaManagedAgentsStreamSessionThreadEvents,
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
end
