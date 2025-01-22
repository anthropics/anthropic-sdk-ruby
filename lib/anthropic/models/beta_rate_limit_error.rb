# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # beta_rate_limit_error => {
    #   message: String,
    #   type: Anthropic::Models::BetaRateLimitError::Type
    # }
    # ```
    class BetaRateLimitError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BetaRateLimitError::Type]
      required :type, enum: -> { Anthropic::Models::BetaRateLimitError::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case type
      # in :rate_limit_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        RATE_LIMIT_ERROR = :rate_limit_error

        finalize!
      end
    end
  end
end
