# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserReadConsoleInput < Anthropic::Internal::Type::BaseModel
        # @!attribute tab_id
        #   Tab to act on. Defaults to the active tab when omitted.
        #
        #   @return [String, nil]
        optional :tab_id, String, nil?: true

        # @!method initialize(tab_id: nil)
        #   Return console output (log entries, errors, warnings) accumulated since the
        #   driver attached to the tab and since the last read, one line per entry. An empty
        #   result does not mean no traffic for a tab that predates attach.
        #
        #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
      end
    end

    BetaBrowserReadConsoleInput = Beta::BetaBrowserReadConsoleInput
  end
end
