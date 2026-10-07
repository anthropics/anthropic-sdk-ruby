# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserFindInput < Anthropic::Internal::Type::BaseModel
      # @!attribute query
      #   Natural-language description of the element(s) to find.
      #
      #   @return [String]
      required :query, String

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(query:, tab_id: nil)
      #   Find elements matching a natural-language description (e.g. "search bar", "add
      #   to cart button") and return up to 20 matches with element references.
      #
      #   @param query [String] Natural-language description of the element(s) to find.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
