# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserMouseMoveInput < Anthropic::Internal::Type::BaseModel
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

        # @!method initialize(target:, tab_id: nil)
        #   Move the pointer to a viewport coordinate without clicking.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserMouseMoveInput} for more details.
        #
        #   @param target [Anthropic::Models::Beta::BetaBrowserCoordinateTarget] A point in the browser viewport, in viewport pixels (the same frame as a
        #
        #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
      end
    end

    BetaBrowserMouseMoveInput = Beta::BetaBrowserMouseMoveInput
  end
end
