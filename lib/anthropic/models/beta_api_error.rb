# frozen_string_literal: true

module Anthropic
  module Models
    class BetaAPIError < Anthropic::BaseModel
      # @!attribute message
      #   @return [String]
      required :message, String

      # @!attribute type
      #   @return [Symbol, Anthropic::Models::BetaAPIError::Type]
      required :type, enum: -> { Anthropic::Models::BetaAPIError::Type }

      class Type < Anthropic::Enum
        API_ERROR = :api_error
      end

      # @!parse
      #   # Create a new instance of BetaAPIError from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :message
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
