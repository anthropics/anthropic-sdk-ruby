# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserJavascriptExecInput < Anthropic::Internal::Type::BaseModel
      # @!attribute text
      #   JavaScript to execute in the page context.
      #
      #   @return [String]
      required :text, String

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(text:, tab_id: nil)
      #   Execute JavaScript in the page context and return the value of the last
      #   expression. The code runs with access to the DOM, `window`, and page variables.
      #   Write the expression you want evaluated — do NOT use `return`.
      #
      #   @param text [String] JavaScript to execute in the page context.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
