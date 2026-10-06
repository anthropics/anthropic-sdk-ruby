# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebFetchURLSources < Anthropic::Internal::Type::BaseModel
        # @!attribute client_tool_results
        #   Which custom tools' results contribute URLs that may be fetched. Null when not
        #   set, which allows every custom tool's results.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept, nil]
        required :client_tool_results,
                 union: -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter },
                 nil?: true

        # @!attribute server_tool_results
        #   Which of the web_search and web_fetch tools' results contribute URLs that may be
        #   fetched. Null when not set, which allows both.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept, nil]
        required :server_tool_results,
                 union: -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter },
                 nil?: true

        # @!attribute user_input
        #   Whether URLs in the text of user messages may be fetched. Null when not set,
        #   which allows them.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, nil]
        required :user_input,
                 union: -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput },
                 nil?: true

        # @!method initialize(client_tool_results:, server_tool_results:, user_input:)
        #   Which sources contribute URLs the web_fetch tool may fetch. A key that is null
        #   was not set and allows every URL from that source.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSources} for more details.
        #
        #   @param client_tool_results [Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept, nil] Which custom tools' results contribute URLs that may be fetched. Null when not s
        #
        #   @param server_tool_results [Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceOnly, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceExcept, nil] Which of the web_search and web_fetch tools' results contribute URLs that may be
        #
        #   @param user_input [Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone, nil] Whether URLs in the text of user messages may be fetched. Null when not set, whi
      end
    end

    BetaManagedAgentsWebFetchURLSources = Beta::BetaManagedAgentsWebFetchURLSources
  end
end
