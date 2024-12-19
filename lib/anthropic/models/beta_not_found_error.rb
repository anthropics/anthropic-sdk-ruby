# frozen_string_literal: true

module Anthropic
  module Models
    class BetaNotFoundError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BetaNotFoundError::Type]
      required :type, enum: -> { Anthropic::Models::BetaNotFoundError::Type }

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
      # in :not_found_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        NOT_FOUND_ERROR = :not_found_error
      end
    end
  end
end
