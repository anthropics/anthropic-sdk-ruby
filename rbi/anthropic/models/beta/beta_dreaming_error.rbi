# typed: strong

module Anthropic
  module Models
    BetaDreamingError = Beta::BetaDreamingError

    module Beta
      BetaDreamingError = Anthropic::Models::Beta::BetaDreamingErrorObject
    end
  end
end
