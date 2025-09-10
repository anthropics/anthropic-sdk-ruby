# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaWebFetchToolResultErrorCode
        extend Anthropic::Internal::Type::Enum

        INVALID_TOOL_INPUT = :invalid_tool_input
        URL_TOO_LONG = :url_too_long
        URL_NOT_ALLOWED = :url_not_allowed
        URL_NOT_ACCESSIBLE = :url_not_accessible
        UNSUPPORTED_CONTENT_TYPE = :unsupported_content_type
        TOO_MANY_REQUESTS = :too_many_requests
        MAX_USES_EXCEEDED = :max_uses_exceeded
        UNAVAILABLE = :unavailable

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaWebFetchToolResultErrorCode = Beta::BetaWebFetchToolResultErrorCode
  end
end
