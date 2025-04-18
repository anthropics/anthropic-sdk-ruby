# frozen_string_literal: true

module Anthropic
  module Models
    class APIErrorObject < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :api_error]
      required :type, const: :api_error

      # @!method initialize(message:, type: :api_error)
      #   @param message [String]
      #   @param type [Symbol, :api_error]
    end
  end
end
