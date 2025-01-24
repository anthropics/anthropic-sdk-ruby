# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # billing_error => {
    #   message: String,
    #   type: :billing_error
    # }
    # ```
    class BillingError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :billing_error]
      required :type, const: :billing_error

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type: :billing_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
