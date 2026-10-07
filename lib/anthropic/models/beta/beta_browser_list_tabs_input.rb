# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserListTabsInput < Anthropic::Internal::Type::BaseModel
        # @!method initialize
        #   List all open tabs with each tab's tab_id, title, and URL.
      end
    end

    BetaBrowserListTabsInput = Beta::BetaBrowserListTabsInput
  end
end
