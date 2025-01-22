# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # beta_error_response => {
    #   error: Anthropic::Models::BetaError,
    #   type: Anthropic::Models::BetaErrorResponse::Type
    # }
    # ```
    class BetaErrorResponse < Anthropic::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError]
      required :error, union: -> { Anthropic::Models::BetaError }

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BetaErrorResponse::Type]
      required :type, enum: -> { Anthropic::Models::BetaErrorResponse::Type }

      # @!parse
      #   # @param error [Anthropic::Models::BetaInvalidRequestError, Anthropic::Models::BetaAuthenticationError, Anthropic::Models::BetaBillingError, Anthropic::Models::BetaPermissionError, Anthropic::Models::BetaNotFoundError, Anthropic::Models::BetaRateLimitError, Anthropic::Models::BetaGatewayTimeoutError, Anthropic::Models::BetaAPIError, Anthropic::Models::BetaOverloadedError]
      #   # @param type [String]
      #   #
      #   def initialize(error:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case type
      # in :error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        ERROR = :error

        finalize!
      end
    end
  end
end
