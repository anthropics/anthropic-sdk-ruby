# frozen_string_literal: true

module Anthropic
  module Models
    class BetaErrorResponse < BaseModel
      # @!attribute [rw] error
      #   @return [Anthropic::Models::BetaAPIError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaOverloadedError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaRateLimitError]
      required :error, Anthropic::Unknown

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaErrorResponse::Type]
      required :type, enum: -> { Anthropic::Models::BetaErrorResponse::Type }

      class Type < Anthropic::Enum
        ERROR = :error
      end

      # Create a new instance of BetaErrorResponse from a Hash of raw data.
      #
      # @overload initialize(error: nil, type: nil)
      # @param error [Object]
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
