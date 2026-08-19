# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserStateTabEntry < Anthropic::Internal::Type::BaseModel
        # @!attribute tab_id
        #   The caller-assigned identifier for this tab, unique within the inventory.
        #
        #   @return [String]
        required :tab_id, String

        # @!attribute title
        #   The title of the page the tab is showing. May be empty.
        #
        #   @return [String]
        required :title, String

        # @!attribute url
        #   The URL of the page the tab is showing. May be empty.
        #
        #   @return [String]
        required :url, String

        # @!attribute active
        #   Whether this tab is the active tab after this call. Whenever `tabs` is
        #   non-empty, exactly one entry is marked `active: true`.
        #
        #   @return [Boolean, nil]
        optional :active, Anthropic::Internal::Type::Boolean

        # @!method initialize(tab_id:, title:, url:, active: nil)
        #   One open browser tab reported in a `browser_state` block's `tabs` inventory.
        #
        #   `tab_id` is the caller-assigned identifier for the tab; `title` and `url`
        #   describe the page the tab is currently showing and may be empty strings (a blank
        #   tab legitimately has both empty). `active` marks the tab that is active after
        #   this call; whenever `tabs` is non-empty, exactly one entry is marked.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserStateTabEntry} for more details.
        #
        #   @param tab_id [String] The caller-assigned identifier for this tab, unique within the inventory.
        #
        #   @param title [String] The title of the page the tab is showing. May be empty.
        #
        #   @param url [String] The URL of the page the tab is showing. May be empty.
        #
        #   @param active [Boolean] Whether this tab is the active tab after this call. Whenever `tabs` is non-empty
      end
    end

    BetaBrowserStateTabEntry = Beta::BetaBrowserStateTabEntry
  end
end
