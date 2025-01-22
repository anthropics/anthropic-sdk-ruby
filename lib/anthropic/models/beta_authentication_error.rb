# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # beta_authentication_error => {
    #   message: String,
    #   type: Anthropic::Models::BetaAuthenticationError::Type
    # }
    # ```
    class BetaAuthenticationError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BetaAuthenticationError::Type]
      required :type, enum: -> { Anthropic::Models::BetaAuthenticationError::Type }

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
