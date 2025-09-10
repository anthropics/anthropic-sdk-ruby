# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaServerToolUsage < Anthropic::Internal::Type::BaseModel
        # @!attribute web_fetch_requests
        #   The number of web fetch tool requests.
        #
        #   @return [Integer]
        required :web_fetch_requests, Integer

        # @!attribute web_search_requests
        #   The number of web search tool requests.
        #
        #   @return [Integer]
        required :web_search_requests, Integer

        # @!method initialize(web_fetch_requests:, web_search_requests:)
        #   @param web_fetch_requests [Integer] The number of web fetch tool requests.
        #
        #   @param web_search_requests [Integer] The number of web search tool requests.
      end
    end

    BetaServerToolUsage = Beta::BetaServerToolUsage
  end
end
