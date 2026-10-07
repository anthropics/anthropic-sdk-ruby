# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserScreenshotInput < Anthropic::Internal::Type::BaseModel
      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(tab_id: nil)
      #   Capture the current browser viewport.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
