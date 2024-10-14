# frozen_string_literal: true

module Anthropic
  module Models
    class BetaInvalidRequestError < BaseModel
      # @!attribute [rw] message
      #   @return [String]
      required :message, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaInvalidRequestError::Type]
      required :type, enum: -> { Anthropic::Models::BetaInvalidRequestError::Type }

      class Type < Anthropic::Enum
        INVALID_REQUEST_ERROR = :invalid_request_error
      end

      # Create a new instance of BetaInvalidRequestError from a Hash of raw data.
      #
      # @overload initialize(message: nil, type: nil)
      # @param message [String]
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
