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

      # @!method initialize(message:, type: :not_found_error)
      #   @param message [String]
      #   @param type [Symbol, :not_found_error]
    end
  end
end
