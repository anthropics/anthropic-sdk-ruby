# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # not_found_error => {
    #   message: String,
    #   type: Anthropic::Models::NotFoundError_::Type
    # }
    # ```
    class NotFoundError_ < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::NotFoundError_::Type]
      required :type, enum: -> { Anthropic::Models::NotFoundError_::Type }

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
      # in :not_found_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        NOT_FOUND_ERROR = :not_found_error

        finalize!
      end
    end
  end
end
