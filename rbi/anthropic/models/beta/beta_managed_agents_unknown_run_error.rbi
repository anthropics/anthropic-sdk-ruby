# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsUnknownRunError = Beta::BetaManagedAgentsUnknownRunError

    module Beta
      BetaManagedAgentsUnknownRunError =
        Anthropic::Models::Beta::BetaManagedAgentsUnknownRunErrorObject
    end
  end
end
