# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserCloseTabInput < Anthropic::Internal::Type::BaseModel
      # @!attribute tab_id
      #   The tab to close.
      #
      #   @return [String]
      required :tab_id, String

      # @!method initialize(tab_id:)
      #   Close the tab with the given tab_id.
      #
      #   @param tab_id [String] The tab to close.
    end
  end
end
