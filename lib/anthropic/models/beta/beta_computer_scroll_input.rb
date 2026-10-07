# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerScrollInput < Anthropic::Internal::Type::BaseModel
        # @!attribute scroll_amount
        #   Number of 'clicks' of the scroll wheel.
        #
        #   @return [Integer]
        required :scroll_amount, Integer

        # @!attribute scroll_direction
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaComputerScrollDirection]
        required :scroll_direction, enum: -> { Anthropic::Beta::BetaComputerScrollDirection }

        # @!attribute coordinate
        #   (x, y): x pixels from the left edge, y pixels from the top edge.
        #
        #   @return [Array<Integer>, nil]
        optional :coordinate, Anthropic::Internal::Type::ArrayOf[Integer], nil?: true

        # @!attribute text
        #   Optional key combination to hold down during this action (e.g. "ctrl", "shift",
        #   "ctrl+shift").
        #
        #   @return [String, nil]
        optional :text, String, nil?: true

        # @!method initialize(scroll_amount:, scroll_direction:, coordinate: nil, text: nil)
        #   Scroll the screen at the specified (x, y) pixel coordinate, or the current
        #   cursor position if `coordinate` is omitted. Do NOT use PageUp/PageDown to
        #   scroll.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerScrollInput} for more details.
        #
        #   @param scroll_amount [Integer] Number of 'clicks' of the scroll wheel.
        #
        #   @param scroll_direction [Symbol, Anthropic::Models::Beta::BetaComputerScrollDirection]
        #
        #   @param coordinate [Array<Integer>, nil] (x, y): x pixels from the left edge, y pixels from the top edge.
        #
        #   @param text [String, nil] Optional key combination to hold down during this action (e.g. "ctrl", "shift",
      end
    end

    BetaComputerScrollInput = Beta::BetaComputerScrollInput
  end
end
