# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserLeftClickDragInput < Anthropic::Internal::Type::BaseModel
        # @!attribute from
        #   A point in the browser viewport, in viewport pixels (the same frame as a
        #   full-viewport screenshot).
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserCoordinateTarget]
        required :from, -> { Anthropic::Beta::BetaBrowserCoordinateTarget }

        # @!attribute target
        #   A point in the browser viewport, in viewport pixels (the same frame as a
        #   full-viewport screenshot).
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserCoordinateTarget]
        required :target, -> { Anthropic::Beta::BetaBrowserCoordinateTarget }

        # @!attribute tab_id
        #   Tab to act on. Defaults to the active tab when omitted.
        #
        #   @return [String, nil]
        optional :tab_id, String, nil?: true

        # @!method initialize(from:, target:, tab_id: nil)
        #   Press at `from`, drag to `target`, release. Both must be coordinate targets.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserLeftClickDragInput} for more details.
        #
        #   @param from [Anthropic::Models::Beta::BetaBrowserCoordinateTarget] A point in the browser viewport, in viewport pixels (the same frame as a
        #
        #   @param target [Anthropic::Models::Beta::BetaBrowserCoordinateTarget] A point in the browser viewport, in viewport pixels (the same frame as a
        #
        #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
      end
    end

    BetaBrowserLeftClickDragInput = Beta::BetaBrowserLeftClickDragInput
  end
end
