# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserStateChangeTabOpened < Anthropic::Internal::Type::BaseModel
        # @!attribute tab_id
        #   The `tab_id` of the opened tab, present in `tabs`.
        #
        #   @return [String]
        required :tab_id, String

        # @!attribute type
        #
        #   @return [Symbol, :tab_opened]
        required :type, const: :tab_opened

        # @!method initialize(tab_id:, type: :tab_opened)
        #   A tab this call's execution opened that remains open at its end — the creation
        #   delta of the `tabs` inventory, not an event log.
        #
        #   Carries only the `tab_id`; the tab's `title` and `url` live on its `tabs` entry,
        #   which must include the same `tab_id`. A tab opened during a failed call gets no
        #   deferred `tab_opened`; it simply appears in the next result's `tabs` inventory.
        #
        #   @param tab_id [String] The `tab_id` of the opened tab, present in `tabs`.
        #
        #   @param type [Symbol, :tab_opened]
      end
    end

    BetaBrowserStateChangeTabOpened = Beta::BetaBrowserStateChangeTabOpened
  end
end
