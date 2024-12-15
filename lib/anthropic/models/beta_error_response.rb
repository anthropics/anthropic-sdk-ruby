# frozen_string_literal: true

module Anthropic
  module Models
    class BetaErrorResponse < Anthropic::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::Models::BetaAPIError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaOverloadedError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaRateLimitError]
      required :error, Anthropic::Unknown

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BetaErrorResponse::Type]
      required :type, enum: -> { Anthropic::Models::BetaErrorResponse::Type }

      # @!parse
      #   # @param error [Object]
      #   # @param type [String]
      #   #
      #   def initialize(error:, type:) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      class Type < Anthropic::Enum
        ERROR = :error
      end
    end
  end
end
