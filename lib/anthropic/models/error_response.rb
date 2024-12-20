# frozen_string_literal: true

module Anthropic
  module Models
    class ErrorResponse < Anthropic::BaseModel
      # @!attribute error
      #
      #   @return [Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError_, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError_, Anthropic::Models::RateLimitError_, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError]
      required :error, union: -> { Anthropic::Models::ErrorObject }

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::ErrorResponse::Type]
      required :type, enum: -> { Anthropic::Models::ErrorResponse::Type }

      # @!parse
      #   # @param error [Anthropic::Models::InvalidRequestError, Anthropic::Models::AuthenticationError_, Anthropic::Models::BillingError, Anthropic::Models::PermissionError, Anthropic::Models::NotFoundError_, Anthropic::Models::RateLimitError_, Anthropic::Models::GatewayTimeoutError, Anthropic::Models::APIErrorObject, Anthropic::Models::OverloadedError]
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

        finalize!
      end
    end
  end
end
