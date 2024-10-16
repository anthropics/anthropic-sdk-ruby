# frozen_string_literal: true

module Anthropic
  module Models
    class BetaAuthenticationError < BaseModel
      # @!attribute [rw] message
      #   @return [String]
      required :message, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaAuthenticationError::Type]
      required :type, enum: -> { Anthropic::Models::BetaAuthenticationError::Type }

      class Type < Anthropic::Enum
        AUTHENTICATION_ERROR = :authentication_error
      end

      # @!parse
      #   # Create a new instance of BetaAuthenticationError from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :message
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
