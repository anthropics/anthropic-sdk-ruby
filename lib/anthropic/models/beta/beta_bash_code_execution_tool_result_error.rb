# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @deprecated BetaBashCodeExecutionToolResultError has been renamed to
      # BetaBashCodeExecutionToolResultErrorObject
      BetaBashCodeExecutionToolResultError =
        Anthropic::Models::Beta::BetaBashCodeExecutionToolResultErrorObject
    end

    BetaBashCodeExecutionToolResultError = Beta::BetaBashCodeExecutionToolResultError
  end
end
