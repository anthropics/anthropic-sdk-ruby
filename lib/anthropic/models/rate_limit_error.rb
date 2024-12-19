# frozen_string_literal: true

module Anthropic
  module Models
    class RateLimitError_ < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::RateLimitError_::Type]
      required :type, enum: -> { Anthropic::Models::RateLimitError_::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :rate_limit_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        RATE_LIMIT_ERROR = :rate_limit_error
      end
    end
  end
end
