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
    end
  end
end
