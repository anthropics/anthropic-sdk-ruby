# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserFormInputInput < Anthropic::Internal::Type::BaseModel
        # @!attribute target
        #   An element on the page, identified by a reference from a prior `read_page` or
        #   `find` result. References are scoped to the tab that produced them and become
        #   stale after navigation or a major re-render.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserRefTarget]
        required :target, -> { Anthropic::Beta::BetaBrowserRefTarget }

        # @!attribute value
        #   The value to set.
        #
        #   @return [String, Float, Boolean]
        required :value, union: -> { Anthropic::Beta::BetaBrowserFormInputValue }

        # @!attribute tab_id
        #   Tab to act on. Defaults to the active tab when omitted.
        #
        #   @return [String, nil]
        optional :tab_id, String, nil?: true

        # @!method initialize(target:, value:, tab_id: nil)
        #   Set the value of a form element (input, textarea, select, checkbox). Use a
        #   boolean for checkboxes, an option value or text for selects.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserFormInputInput} for more details.
        #
        #   @param target [Anthropic::Models::Beta::BetaBrowserRefTarget] An element on the page, identified by a reference from a prior `read_page` or
        #
        #   @param value [String, Float, Boolean] The value to set.
        #
        #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
      end
    end

    BetaBrowserFormInputInput = Beta::BetaBrowserFormInputInput
  end
end
