# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerHoldKeyInput < Anthropic::Internal::Type::BaseModel
      # @!attribute duration
      #   Duration to hold the key, in seconds.
      #
      #   @return [Integer]
      required :duration, Integer

      # @!attribute text
      #   The key or key-combination to hold.
      #
      #   @return [String]
      required :text, String

      # @!method initialize(duration:, text:)
      #   Hold down a key or key-combination for a specified duration. Uses the same key
      #   syntax as `key`.
      #
      #   @param duration [Integer] Duration to hold the key, in seconds.
      #
      #   @param text [String] The key or key-combination to hold.
    end
  end
end
