# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # beta_invalid_request_error => {
    #   message: String,
    #   type: :invalid_request_error
    # }
    # ```
    class BetaInvalidRequestError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :invalid_request_error]
      required :type, const: :invalid_request_error

      # @!parse
      #   # @param message [String]
      #   # @param type [Symbol, :invalid_request_error]
      #   #
      #   def initialize(message:, type: :invalid_request_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
