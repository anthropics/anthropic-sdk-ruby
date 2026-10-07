# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerTripleClickInput < Anthropic::Internal::Type::BaseModel
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

      # @!method initialize(coordinate: nil, text: nil)
      #   Triple-click the left mouse button at the specified (x, y) pixel coordinate, or
      #   the current cursor position if `coordinate` is omitted.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ComputerTripleClickInput} for more details.
      #
      #   @param coordinate [Array<Integer>, nil] (x, y): x pixels from the left edge, y pixels from the top edge.
      #
      #   @param text [String, nil] Optional key combination to hold down during this action (e.g. "ctrl", "shift",
    end
  end
end
