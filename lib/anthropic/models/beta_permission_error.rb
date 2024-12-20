# frozen_string_literal: true

module Anthropic
  module Models
    class BetaPermissionError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BetaPermissionError::Type]
      required :type, enum: -> { Anthropic::Models::BetaPermissionError::Type }

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
      # in :permission_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        PERMISSION_ERROR = :permission_error

        finalize!
      end
    end
  end
end
