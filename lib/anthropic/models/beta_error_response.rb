# frozen_string_literal: true

module Anthropic
  module Models
    class BetaErrorResponse < Anthropic::BaseModel
      # @!attribute error
      #   @return [Anthropic::Models::BetaAPIError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaOverloadedError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaRateLimitError]
      required :error, Anthropic::Unknown

      # @!attribute type
      #   @return [Symbol, Anthropic::Models::BetaErrorResponse::Type]
      required :type, enum: -> { Anthropic::Models::BetaErrorResponse::Type }

      class Type < Anthropic::Enum
        ERROR = :error
      end

      # @!parse
      #   # Create a new instance of BetaErrorResponse from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Object] :error
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
