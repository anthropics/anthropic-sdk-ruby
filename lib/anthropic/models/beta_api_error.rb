# frozen_string_literal: true

module Anthropic
  module Models
    class BetaAPIError < BaseModel
      # @!attribute [rw] message
      #   @return [String]
      required :message, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaAPIError::Type]
      required :type, enum: -> { Anthropic::Models::BetaAPIError::Type }

      class Type < Anthropic::Enum
        API_ERROR = :api_error
      end

      # Create a new instance of BetaAPIError from a Hash of raw data.
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
