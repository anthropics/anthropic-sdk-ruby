# frozen_string_literal: true

module Anthropic
  module Models
    class PermissionError < Anthropic::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :permission_error]
      required :type, const: :permission_error

      # @!method initialize(message:, type: :permission_error)
      #   @param message [String]
      #   @param type [Symbol, :permission_error]
    end
  end
end
