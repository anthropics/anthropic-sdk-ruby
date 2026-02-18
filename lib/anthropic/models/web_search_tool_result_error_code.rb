# frozen_string_literal: true

module Anthropic
  module Models
    module WebSearchToolResultErrorCode
      extend Anthropic::Internal::Type::Enum

      INVALID_TOOL_INPUT = :invalid_tool_input
      UNAVAILABLE = :unavailable
      MAX_USES_EXCEEDED = :max_uses_exceeded
      TOO_MANY_REQUESTS = :too_many_requests
      QUERY_TOO_LONG = :query_too_long
      REQUEST_TOO_LARGE = :request_too_large

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
