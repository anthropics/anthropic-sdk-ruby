# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserMiddleClickInput < Anthropic::Internal::Type::BaseModel
      # @!attribute target
      #   Where to act: either a viewport coordinate or an element reference.
      #
      #   @return [Anthropic::Models::BrowserCoordinateTarget, Anthropic::Models::BrowserRefTarget]
      required :target, union: -> { Anthropic::BrowserClickTarget }

      # @!attribute modifiers
      #   Optional modifier key chord to hold for the duration of this action (e.g.
      #   "shift", "ctrl+shift", "cmd+alt").
      #
      #   @return [String, nil]
      optional :modifiers, String, nil?: true

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(target:, modifiers: nil, tab_id: nil)
      #   Middle-click at a viewport coordinate or on an element by reference.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserMiddleClickInput} for more details.
      #
      #   @param target [Anthropic::Models::BrowserCoordinateTarget, Anthropic::Models::BrowserRefTarget] Where to act: either a viewport coordinate or an element reference.
      #
      #   @param modifiers [String, nil] Optional modifier key chord to hold for the duration of this action (e.g. "shift
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
