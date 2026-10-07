# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserScrollInput < Anthropic::Internal::Type::BaseModel
        # @!attribute scroll_direction
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaBrowserScrollDirection]
        required :scroll_direction, enum: -> { Anthropic::Beta::BetaBrowserScrollDirection }

        # @!attribute target
        #   A point in the browser viewport, in viewport pixels (the same frame as a
        #   full-viewport screenshot).
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserCoordinateTarget]
        required :target, -> { Anthropic::Beta::BetaBrowserCoordinateTarget }

        # @!attribute scroll_amount
        #   Scroll-wheel notches (1–10). Default 3.
        #
        #   @return [Integer, nil]
        optional :scroll_amount, Integer, nil?: true

        # @!attribute tab_id
        #   Tab to act on. Defaults to the active tab when omitted.
        #
        #   @return [String, nil]
        optional :tab_id, String, nil?: true

        # @!method initialize(scroll_direction:, target:, scroll_amount: nil, tab_id: nil)
        #   Scroll at a viewport position. `target` must be a coordinate target.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserScrollInput} for more details.
        #
        #   @param scroll_direction [Symbol, Anthropic::Models::Beta::BetaBrowserScrollDirection]
        #
        #   @param target [Anthropic::Models::Beta::BetaBrowserCoordinateTarget] A point in the browser viewport, in viewport pixels (the same frame as a
        #
        #   @param scroll_amount [Integer, nil] Scroll-wheel notches (1–10). Default 3.
        #
        #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
      end
    end

    BetaBrowserScrollInput = Beta::BetaBrowserScrollInput
  end
end
