# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerMouseMoveInput < Anthropic::Internal::Type::BaseModel
      # @!attribute coordinate
      #   (x, y): x pixels from the left edge, y pixels from the top edge.
      #
      #   @return [Array<Integer>]
      required :coordinate, Anthropic::Internal::Type::ArrayOf[Integer]

      # @!method initialize(coordinate:)
      #   Move the cursor to a specified (x, y) pixel coordinate. Use this ONLY to hover
      #   without clicking; otherwise use a click action directly.
      #
      #   @param coordinate [Array<Integer>] (x, y): x pixels from the left edge, y pixels from the top edge.
    end
  end
end
