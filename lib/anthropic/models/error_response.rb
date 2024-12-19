# frozen_string_literal: true

module Anthropic
  module Models
    class ErrorResponse < Anthropic::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::Models::APIErrorObject, Anthropic::Models::AuthenticationError_, Anthropic::Models::BillingError, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::InvalidRequestError, Anthropic::Models::NotFoundError_, Anthropic::Models::OverloadedError, Anthropic::Models::PermissionError, Anthropic::Models::RateLimitError_]
      required :error, Anthropic::Unknown

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::ErrorResponse::Type]
      required :type, enum: -> { Anthropic::Models::ErrorResponse::Type }

      # @!parse
      #   # @param error [Anthropic::Models::APIErrorObject, Anthropic::Models::AuthenticationError_, Anthropic::Models::BillingError, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::InvalidRequestError, Anthropic::Models::NotFoundError_, Anthropic::Models::OverloadedError, Anthropic::Models::PermissionError, Anthropic::Models::RateLimitError_]
      #   # @param type [String]
      #   #
      #   def initialize(error:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        ERROR = :error
      end
    end
  end
end
