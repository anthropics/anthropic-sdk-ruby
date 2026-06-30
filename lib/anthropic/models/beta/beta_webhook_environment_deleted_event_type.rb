# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaWebhookEnvironmentDeletedEventType
        extend Anthropic::Internal::Type::Enum

        ENVIRONMENT_DELETED = :"environment.deleted"

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaWebhookEnvironmentDeletedEventType = Beta::BetaWebhookEnvironmentDeletedEventType
  end
end
