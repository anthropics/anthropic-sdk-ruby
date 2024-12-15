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
      #   @return [Symbol, Anthropic::Models::BetaRateLimitError::Type]
      required :type, enum: -> { Anthropic::Models::BetaRateLimitError::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      class Type < Anthropic::Enum
        RATE_LIMIT_ERROR = :rate_limit_error
      end
    end
  end
end
