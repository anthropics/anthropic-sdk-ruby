# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserKeyInput < Anthropic::Internal::Type::BaseModel
      # @!attribute text
      #   The key, chord, or space-separated sequence to press.
      #
      #   @return [String]
      required :text, String

      # @!attribute repeat
      #   Number of times to repeat. Default 1.
      #
      #   @return [Integer, nil]
      optional :repeat, Integer, nil?: true

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(text:, repeat: nil, tab_id: nil)
      #   Press a key or key chord. Use "+" to combine modifiers with a key (e.g.
      #   "ctrl+a", "cmd+shift+p") and space to sequence presses (e.g. "Backspace
      #   Backspace Delete"). Common names like "Return", "Tab", "Escape", "BackSpace" are
      #   supported.
      #
      #   @param text [String] The key, chord, or space-separated sequence to press.
      #
      #   @param repeat [Integer, nil] Number of times to repeat. Default 1.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
