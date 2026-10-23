# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Kind of identity a row's usage is attributed to.
        module BetaAnalyticsActorType
          extend Anthropic::Internal::Type::Enum

          API_ACTOR = :api_actor
          FEDERATED_ACTOR = :federated_actor
          SERVICE_ACCOUNT_ACTOR = :service_account_actor
          USER_ACTOR = :user_actor

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
