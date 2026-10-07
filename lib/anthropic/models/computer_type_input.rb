# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerTypeInput < Anthropic::Internal::Type::BaseModel
      # @!attribute text
      #   The text to type.
      #
      #   @return [String]
      required :text, String

      # @!method initialize(text:)
      #   Type a string of text on the keyboard.
      #
      #   @param text [String] The text to type.
    end
  end
end
