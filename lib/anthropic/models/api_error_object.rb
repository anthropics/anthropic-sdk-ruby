# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # api_error_object => {
    #   message: String,
    #   type: :api_error
    # }
    # ```
    class APIErrorObject < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :api_error]
      required :type, const: :api_error

      # @!parse
      #   # @param message [String]
      #   # @param type [Symbol, :api_error]
      #   #
      #   def initialize(message:, type: :api_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
