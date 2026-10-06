# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebFetchURLSourcesParams < Anthropic::Internal::Type::BaseModel
        # @!attribute client_tool_results
        #   Which custom tools' results contribute URLs that may be fetched: "all" (the
        #   default), "none", or an only or except list. Each name in a list must be a
        #   custom tool in the same tools array.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceShorthand, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept, nil]
        optional :client_tool_results,
                 union: -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilterParams },
                 nil?: true

        # @!attribute server_tool_results
        #   Which of the web_search and web_fetch tools' results contribute URLs that may be
        #   fetched: "all" (the default), "none", or an only or except list. Each name in a
        #   list must be "web_search" or "web_fetch".
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceShorthand, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept, nil]
        optional :server_tool_results,
                 union: -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilterParams },
                 nil?: true

        # @!attribute user_input
        #   Whether URLs in the text of user messages may be fetched: "all" (the default) or
        #   "none".
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceShorthand, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, nil]
        optional :user_input,
                 union: -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInputParams },
                 nil?: true

        # @!method initialize(client_tool_results: nil, server_tool_results: nil, user_input: nil)
        #   Which sources contribute URLs the web_fetch tool may fetch. When web_fetch is
        #   limited to URLs the conversation has already shown the model (in a user message,
        #   a custom tool's result, or an earlier web_search or web_fetch result), each key
        #   narrows one of those sources and defaults to "all". Setting all three keys to
        #   "none" is rejected.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourcesParams} for more
        #   details.
        #
        #   @param client_tool_results [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceShorthand, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept, nil] Which custom tools' results contribute URLs that may be fetched: "all" (the defa
        #
        #   @param server_tool_results [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceShorthand, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept, nil] Which of the web_search and web_fetch tools' results contribute URLs that may be
        #
        #   @param user_input [Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceShorthand, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, nil] Whether URLs in the text of user messages may be fetched: "all" (the default) or
      end
    end

    BetaManagedAgentsWebFetchURLSourcesParams = Beta::BetaManagedAgentsWebFetchURLSourcesParams
  end
end
