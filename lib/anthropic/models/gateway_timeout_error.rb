# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # gateway_timeout_error => {
    #   message: String,
    #   type: :timeout_error
    # }
    # ```
    class GatewayTimeoutError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :timeout_error]
      required :type, const: :timeout_error

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type: :timeout_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
