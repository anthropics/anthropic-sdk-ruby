# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRateLimitError < BaseModel
      # @!attribute [rw] message
      #   @return [String]
      required :message, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaRateLimitError::Type]
      required :type, enum: -> { Anthropic::Models::BetaRateLimitError::Type }

      class Type < Anthropic::Enum
        RATE_LIMIT_ERROR = :rate_limit_error
      end

      # @!parse
      #   # Create a new instance of BetaRateLimitError from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :message
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
