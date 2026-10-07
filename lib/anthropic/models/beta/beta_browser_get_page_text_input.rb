# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserGetPageTextInput < Anthropic::Internal::Type::BaseModel
        # @!attribute tab_id
        #   Tab to act on. Defaults to the active tab when omitted.
        #
        #   @return [String, nil]
        optional :tab_id, String, nil?: true

        # @!method initialize(tab_id: nil)
        #   Return the page's visible text content as plain text, prioritizing article
        #   content. Suited to articles, documentation, and other text-heavy pages.
        #
        #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
      end
    end

    BetaBrowserGetPageTextInput = Beta::BetaBrowserGetPageTextInput
  end
end
