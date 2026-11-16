# typed: strong

module Anthropic
  module Models
    BetaCodeExecutionToolResultError = Beta::BetaCodeExecutionToolResultError

    module Beta
      BetaCodeExecutionToolResultError =
        Anthropic::Models::Beta::BetaCodeExecutionToolResultErrorObject
    end
  end
end
