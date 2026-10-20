# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Whether deliveries are sent to an organization webhook endpoint.
        module BetaOrganizationWebhookEndpointState
          extend Anthropic::Internal::Type::Enum

          DISABLED = :disabled
          ENABLED = :enabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
