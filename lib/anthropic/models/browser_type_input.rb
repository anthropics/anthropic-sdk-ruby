# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserTypeInput < Anthropic::Internal::Type::BaseModel
      # @!attribute text
      #   The text to type.
      #
      #   @return [String]
      required :text, String

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(text:, tab_id: nil)
      #   Type a literal string at the current focus.
      #
      #   @param text [String] The text to type.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
