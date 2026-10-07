# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserSwitchTabInput < Anthropic::Internal::Type::BaseModel
        # @!attribute tab_id
        #   The tab to switch to.
        #
        #   @return [String]
        required :tab_id, String

        # @!method initialize(tab_id:)
        #   Make the tab with the given tab_id the active tab — the tab that actions without
        #   a tab_id apply to.
        #
        #   @param tab_id [String] The tab to switch to.
      end
    end

    BetaBrowserSwitchTabInput = Beta::BetaBrowserSwitchTabInput
  end
end
