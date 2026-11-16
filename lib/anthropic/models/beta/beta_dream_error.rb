# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @deprecated BetaDreamError has been renamed to BetaDreamErrorObject
      BetaDreamError = Anthropic::Models::Beta::BetaDreamErrorObject
    end

    BetaDreamError = Beta::BetaDreamError
  end
end
