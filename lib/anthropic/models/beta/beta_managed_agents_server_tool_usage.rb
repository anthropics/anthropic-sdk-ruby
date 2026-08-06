# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsServerToolUsage < Anthropic::Internal::Type::BaseModel
        # @!attribute web_fetch_requests
        #   Number of server-executed web fetch requests.
        #
        #   @return [Integer, nil]
        optional :web_fetch_requests, Integer

        # @!attribute web_search_requests
        #   Number of server-executed web search requests.
        #
        #   @return [Integer, nil]
        optional :web_search_requests, Integer

        # @!method initialize(web_fetch_requests: nil, web_search_requests: nil)
        #   Cumulative count of server-executed tool invocations, broken down by tool.
        #
        #   @param web_fetch_requests [Integer] Number of server-executed web fetch requests.
        #
        #   @param web_search_requests [Integer] Number of server-executed web search requests.
      end
    end

    BetaManagedAgentsServerToolUsage = Beta::BetaManagedAgentsServerToolUsage
  end
end
