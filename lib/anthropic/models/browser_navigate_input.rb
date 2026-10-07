# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserNavigateInput < Anthropic::Internal::Type::BaseModel
      # @!attribute url
      #   The URL to navigate to, or "back" / "forward" / "reload" for history navigation.
      #
      #   @return [String]
      required :url, String

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(url:, tab_id: nil)
      #   Navigate to a URL, or go back/forward/reload in history. The protocol may be
      #   omitted (defaults to https://).
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserNavigateInput} for more details.
      #
      #   @param url [String] The URL to navigate to, or "back" / "forward" / "reload" for history navigation.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
