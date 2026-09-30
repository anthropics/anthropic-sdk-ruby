# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsServerToolUse < Anthropic::Internal::Type::BaseModel
          # @!attribute web_search_requests
          #   The number of web search requests made.
          #
          #   @return [Integer]
          required :web_search_requests, Integer

          # @!method initialize(web_search_requests:)
          #   @param web_search_requests [Integer] The number of web search requests made.
        end
      end
    end
  end
end
