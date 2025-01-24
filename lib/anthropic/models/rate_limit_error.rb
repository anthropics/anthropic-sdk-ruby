# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # rate_limit_error => {
    #   message: String,
    #   type: :rate_limit_error
    # }
    # ```
    class RateLimitError_ < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :rate_limit_error]
      required :type, const: :rate_limit_error

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type: :rate_limit_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
