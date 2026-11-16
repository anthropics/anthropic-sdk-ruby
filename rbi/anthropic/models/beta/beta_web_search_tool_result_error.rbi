# typed: strong

module Anthropic
  module Models
    BetaWebSearchToolResultError = Beta::BetaWebSearchToolResultError

    module Beta
      BetaWebSearchToolResultError =
        Anthropic::Models::Beta::BetaWebSearchToolResultErrorObject
    end
  end
end
