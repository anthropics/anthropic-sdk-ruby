# frozen_string_literal: true

module Anthropic
  module Models
    class BetaNotFoundError < Anthropic::BaseModel
      # @!attribute [rw] message
      #   @return [String]
      required :message, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaNotFoundError::Type]
      required :type, enum: -> { Anthropic::Models::BetaNotFoundError::Type }

      class Type < Anthropic::Enum
        NOT_FOUND_ERROR = :not_found_error
      end

      # @!parse
      #   # Create a new instance of BetaNotFoundError from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :message
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
