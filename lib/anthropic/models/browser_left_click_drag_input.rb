# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserLeftClickDragInput < Anthropic::Internal::Type::BaseModel
      # @!attribute from
      #   A point in the browser viewport, in viewport pixels (the same frame as a
      #   full-viewport screenshot).
      #
      #   @return [Anthropic::Models::BrowserCoordinateTarget]
      required :from, -> { Anthropic::BrowserCoordinateTarget }

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

      # @!method initialize(from:, target:, tab_id: nil)
      #   Press at `from`, drag to `target`, release. Both must be coordinate targets.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserLeftClickDragInput} for more details.
      #
      #   @param from [Anthropic::Models::BrowserCoordinateTarget] A point in the browser viewport, in viewport pixels (the same frame as a
      #
      #   @param target [Anthropic::Models::BrowserCoordinateTarget] A point in the browser viewport, in viewport pixels (the same frame as a
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
