# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRateLimitError < Anthropic::BaseModel
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
      #   # @param type [Symbol, :rate_limit_error]
      #   #
      #   def initialize(message:, type: :rate_limit_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
