# frozen_string_literal: true

module Anthropic
  module Models
    class AuthenticationError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :authentication_error]
      required :type, const: :authentication_error

      # @!parse
      #   # @param message [String]
      #   # @param type [Symbol, :authentication_error]
      #   #
      #   def initialize(message:, type: :authentication_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
