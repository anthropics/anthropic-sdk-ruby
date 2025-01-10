# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # gateway_timeout_error => {
    #   message: String,
    #   type: enum: Anthropic::Models::GatewayTimeoutError::Type
    # }
    # ```
    class GatewayTimeoutError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::GatewayTimeoutError::Type]
      required :type, enum: -> { Anthropic::Models::GatewayTimeoutError::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case type
      # in :timeout_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        TIMEOUT_ERROR = :timeout_error

        finalize!
      end
    end
  end
end
