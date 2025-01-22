# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # authentication_error => {
    #   message: String,
    #   type: Anthropic::Models::AuthenticationError_::Type
    # }
    # ```
    class AuthenticationError_ < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::AuthenticationError_::Type]
      required :type, enum: -> { Anthropic::Models::AuthenticationError_::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case type
      # in :authentication_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        AUTHENTICATION_ERROR = :authentication_error

        finalize!
      end
    end
  end
end
