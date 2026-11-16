# typed: strong

module Anthropic
  module Models
    BetaToolSearchToolResultError = Beta::BetaToolSearchToolResultError

    module Beta
      BetaToolSearchToolResultError =
        Anthropic::Models::Beta::BetaToolSearchToolResultErrorObject
    end
  end
end
