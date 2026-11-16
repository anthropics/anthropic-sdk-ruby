# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @deprecated BetaManagedAgentsEnvironmentNotFoundRunError has been renamed to
      # BetaManagedAgentsEnvironmentNotFoundRunErrorObject
      BetaManagedAgentsEnvironmentNotFoundRunError =
        Anthropic::Models::Beta::BetaManagedAgentsEnvironmentNotFoundRunErrorObject
    end

    BetaManagedAgentsEnvironmentNotFoundRunError = Beta::BetaManagedAgentsEnvironmentNotFoundRunError
  end
end
