# frozen_string_literal: true

module Anthropic
  module Models
    class ErrorResponse < Anthropic::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError, Anthropic::Models::RateLimitError, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError]
      required :error, union: -> { Anthropic::Models::ErrorObject }

      # @!attribute type
      #
      #   @return [Symbol, :error]
      required :type, const: :error

      # @!parse
      #   # @param error [Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError, Anthropic::Models::RateLimitError, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError]
      #   # @param type [Symbol, :error]
      #   #
      #   def initialize(error:, type: :error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
