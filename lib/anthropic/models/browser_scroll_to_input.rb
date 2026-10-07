# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserScrollToInput < Anthropic::Internal::Type::BaseModel
      # @!attribute target
      #   An element on the page, identified by a reference from a prior `read_page` or
      #   `find` result. References are scoped to the tab that produced them and become
      #   stale after navigation or a major re-render.
      #
      #   @return [Anthropic::Models::BrowserRefTarget]
      required :target, -> { Anthropic::BrowserRefTarget }

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(target:, tab_id: nil)
      #   Scroll an element into view.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserScrollToInput} for more details.
      #
      #   @param target [Anthropic::Models::BrowserRefTarget] An element on the page, identified by a reference from a prior `read_page` or
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
