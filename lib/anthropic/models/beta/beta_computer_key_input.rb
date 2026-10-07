# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerKeyInput < Anthropic::Internal::Type::BaseModel
        # @!attribute text
        #   The key or key-combination to press.
        #
        #   @return [String]
        required :text, String

        # @!attribute repeat
        #   Number of times to repeat the key press. Default is 1.
        #
        #   @return [Integer, nil]
        optional :repeat, Integer, nil?: true

        # @!method initialize(text:, repeat: nil)
        #   Press a key or key-combination on the keyboard. Use "+" to combine modifiers
        #   with a key (e.g. "ctrl+s", "alt+Tab", "ctrl+shift+Escape"). Key names are
        #   case-insensitive; common names like "Return", "Tab", "Escape", "Up", "Down",
        #   "Left", "Right", "Home", "End", "Page_Up", "Page_Down", "Delete", "BackSpace"
        #   are supported.
        #
        #   @param text [String] The key or key-combination to press.
        #
        #   @param repeat [Integer, nil] Number of times to repeat the key press. Default is 1.
      end
    end

    BetaComputerKeyInput = Beta::BetaComputerKeyInput
  end
end
