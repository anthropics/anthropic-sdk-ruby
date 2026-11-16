# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @deprecated BetaDreamingError has been renamed to BetaDreamingErrorObject
      BetaDreamingError = Anthropic::Models::Beta::BetaDreamingErrorObject
    end

    BetaDreamingError = Beta::BetaDreamingError
  end
end
