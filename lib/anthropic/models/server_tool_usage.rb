# frozen_string_literal: true

module Anthropic
  module Models
    class ServerToolUsage < Anthropic::Internal::Type::BaseModel
      # @!attribute web_search_requests
      #   The number of web search tool requests.
      #
      #   @return [Integer]
      required :web_search_requests, Integer

      # @!method initialize(web_search_requests:)
      #   @param web_search_requests [Integer] The number of web search tool requests.
    end
  end
end
