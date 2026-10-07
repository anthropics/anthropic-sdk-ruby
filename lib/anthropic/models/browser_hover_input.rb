# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserHoverInput < Anthropic::Internal::Type::BaseModel
      # @!attribute target
      #   Where to act: either a viewport coordinate or an element reference.
      #
      #   @return [Anthropic::Models::BrowserCoordinateTarget, Anthropic::Models::BrowserRefTarget]
      required :target, union: -> { Anthropic::BrowserClickTarget }

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(target:, tab_id: nil)
      #   Move the cursor to a coordinate or element without clicking.
      #
      #   @param target [Anthropic::Models::BrowserCoordinateTarget, Anthropic::Models::BrowserRefTarget] Where to act: either a viewport coordinate or an element reference.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
