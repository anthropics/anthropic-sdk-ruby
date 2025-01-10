# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # permission_error => {
    #   message: String,
    #   type: Anthropic::Models::PermissionError::Type
    # }
    # ```
    class PermissionError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::PermissionError::Type]
      required :type, enum: -> { Anthropic::Models::PermissionError::Type }

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
