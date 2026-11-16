# typed: strong

module Anthropic
  module Models
    BetaDreamError = Beta::BetaDreamError

    module Beta
      BetaDreamError = Anthropic::Models::Beta::BetaDreamErrorObject
    end
  end
end
