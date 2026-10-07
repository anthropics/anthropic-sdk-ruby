# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserNewTabInput < Anthropic::Internal::Type::BaseModel
        # @!method initialize
        #   Open a new empty tab and return its tab_id.
      end
    end

    BetaBrowserNewTabInput = Beta::BetaBrowserNewTabInput
  end
end
