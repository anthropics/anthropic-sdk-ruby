# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserLeftMouseUpInput < Anthropic::Internal::Type::BaseModel
      # @!attribute target
      #   A point in the browser viewport, in viewport pixels (the same frame as a
      #   full-viewport screenshot).
      #
      #   @return [Anthropic::Models::BrowserCoordinateTarget]
      required :target, -> { Anthropic::BrowserCoordinateTarget }

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(target:, tab_id: nil)
      #   Release the left mouse button at a viewport coordinate.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserLeftMouseUpInput} for more details.
      #
      #   @param target [Anthropic::Models::BrowserCoordinateTarget] A point in the browser viewport, in viewport pixels (the same frame as a
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
