# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerLeftClickDragInput < Anthropic::Internal::Type::BaseModel
        # @!attribute coordinate
        #   (x, y): x pixels from the left edge, y pixels from the top edge.
        #
        #   @return [Array<Integer>]
        required :coordinate, Anthropic::Internal::Type::ArrayOf[Integer]

        # @!attribute start_coordinate
        #   (x, y): x pixels from the left edge, y pixels from the top edge.
        #
        #   @return [Array<Integer>]
        required :start_coordinate, Anthropic::Internal::Type::ArrayOf[Integer]

        # @!attribute text
        #   Optional key combination to hold down during this action (e.g. "ctrl", "shift",
        #   "ctrl+shift").
        #
        #   @return [String, nil]
        optional :text, String, nil?: true

        # @!method initialize(coordinate:, start_coordinate:, text: nil)
        #   Click and drag the cursor from `start_coordinate` to `coordinate`.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerLeftClickDragInput} for more details.
        #
        #   @param coordinate [Array<Integer>] (x, y): x pixels from the left edge, y pixels from the top edge.
        #
        #   @param start_coordinate [Array<Integer>] (x, y): x pixels from the left edge, y pixels from the top edge.
        #
        #   @param text [String, nil] Optional key combination to hold down during this action (e.g. "ctrl", "shift",
      end
    end

    BetaComputerLeftClickDragInput = Beta::BetaComputerLeftClickDragInput
  end
end
