# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @deprecated BetaManagedAgentsFileNotFoundRunError has been renamed to
      # BetaManagedAgentsFileNotFoundRunErrorObject
      BetaManagedAgentsFileNotFoundRunError =
        Anthropic::Models::Beta::BetaManagedAgentsFileNotFoundRunErrorObject
    end

    BetaManagedAgentsFileNotFoundRunError = Beta::BetaManagedAgentsFileNotFoundRunError
  end
end
