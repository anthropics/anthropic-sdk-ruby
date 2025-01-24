# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # beta_overloaded_error => {
    #   message: String,
    #   type: :overloaded_error
    # }
    # ```
    class BetaOverloadedError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :overloaded_error]
      required :type, const: :overloaded_error

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type: :overloaded_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
