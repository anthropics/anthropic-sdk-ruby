# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserReadPageInput < Anthropic::Internal::Type::BaseModel
      # @!attribute depth
      #   Maximum tree depth. Default 15.
      #
      #   @return [Integer, nil]
      optional :depth, Integer, nil?: true

      # @!attribute filter
      #   Which elements to include. Omitted: every visible element. "interactive":
      #   interactive elements only. "all": additionally includes off-viewport elements.
      #
      #   @return [Symbol, Anthropic::Models::BrowserReadPageFilter, nil]
      optional :filter, enum: -> { Anthropic::BrowserReadPageFilter }, nil?: true

      # @!attribute ref
      #   Element reference to read a subtree from. Omit to read from the page root.
      #
      #   @return [String, nil]
      optional :ref, String, nil?: true

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(depth: nil, filter: nil, ref: nil, tab_id: nil)
      #   Return a structured accessibility tree of the page (or the subtree rooted at
      #   `ref`), with element references like [ref_7] that can be used as targets on
      #   later actions. Output is capped at 50,000 characters — narrow with `ref` or a
      #   smaller `depth` when exceeded.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserReadPageInput} for more details.
      #
      #   @param depth [Integer, nil] Maximum tree depth. Default 15.
      #
      #   @param filter [Symbol, Anthropic::Models::BrowserReadPageFilter, nil] Which elements to include. Omitted: every visible element. "interactive": intera
      #
      #   @param ref [String, nil] Element reference to read a subtree from. Omit to read from the page root.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
