# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # beta_not_found_error => {
    #   message: String,
    #   type: :not_found_error
    # }
    # ```
    class BetaNotFoundError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :not_found_error]
      required :type, const: :not_found_error

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type: :not_found_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
