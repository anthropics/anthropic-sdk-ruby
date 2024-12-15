# frozen_string_literal: true

module Anthropic
  module Models
    class BetaPermissionError < Anthropic::BaseModel
      # @!attribute message
      #   @return [String]
      required :message, String

      # @!attribute type
      #   @return [Symbol, Anthropic::Models::BetaPermissionError::Type]
      required :type, enum: -> { Anthropic::Models::BetaPermissionError::Type }

      class Type < Anthropic::Enum
        PERMISSION_ERROR = :permission_error
      end

      # @!parse
      #   # Create a new instance of BetaPermissionError from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :message
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
