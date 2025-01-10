# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # beta_api_error => {
    #   message: String,
    #   type: Anthropic::Models::BetaAPIError::Type
    # }
    # ```
    class BetaAPIError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BetaAPIError::Type]
      required :type, enum: -> { Anthropic::Models::BetaAPIError::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case type
      # in :api_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        API_ERROR = :api_error

        finalize!
      end
    end
  end
end
