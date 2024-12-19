# frozen_string_literal: true

module Anthropic
  module Models
    class APIErrorObject < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::APIErrorObject::Type]
      required :type, enum: -> { Anthropic::Models::APIErrorObject::Type }

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
      # in :api_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        API_ERROR = :api_error
      end
    end
  end
end
