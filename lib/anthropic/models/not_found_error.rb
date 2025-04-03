# frozen_string_literal: true

module Anthropic
  module Models
    class NotFoundError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :not_found_error]
      required :type, const: :not_found_error

      # @!parse
      #   # @param message [String]
      #   # @param type [Symbol, :not_found_error]
      #   #
      #   def initialize(message:, type: :not_found_error, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
