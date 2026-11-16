# typed: strong

module Anthropic
  module Models
    BetaWebSearchToolRequestError = Beta::BetaWebSearchToolRequestError

    module Beta
      BetaWebSearchToolRequestError =
        Anthropic::Models::Beta::BetaWebSearchToolRequestErrorObject
    end
  end
end
