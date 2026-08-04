# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingDelta < Anthropic::Internal::Type::BaseModel
      # @!attribute thinking
      #   The incremental `thinking` text for this content block. Concatenate the
      #   `thinking` values of successive `thinking_delta` events to assemble the block's
      #   full `thinking` value.
      #
      #   @return [String]
      required :thinking, String

      # @!attribute type
      #
      #   @return [Symbol, :thinking_delta]
      required :type, const: :thinking_delta

      # @!method initialize(thinking:, type: :thinking_delta)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ThinkingDelta} for more details.
      #
      #   @param thinking [String] The incremental `thinking` text for this content block. Concatenate the `thinkin
      #
      #   @param type [Symbol, :thinking_delta]
    end
  end
end
