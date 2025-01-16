# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # invalid_request_error => {
    #   message: String,
    #   type: enum: Anthropic::Models::InvalidRequestError::Type
    # }
    # ```
    class InvalidRequestError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::InvalidRequestError::Type]
      required :type, enum: -> { Anthropic::Models::InvalidRequestError::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case type
      # in :invalid_request_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        INVALID_REQUEST_ERROR = :invalid_request_error

        finalize!
      end
    end
  end
end
