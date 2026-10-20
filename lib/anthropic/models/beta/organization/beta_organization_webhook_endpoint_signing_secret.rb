# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Webhooks#regenerate_signing_secret
        class BetaOrganizationWebhookEndpointSigningSecret < Anthropic::Internal::Type::BaseModel
          # @!attribute signing_secret
          #   The new signing secret. Deliveries are signed with it from now on, and no other
          #   response returns it.
          #
          #   @return [String]
          required :signing_secret, String

          # @!method initialize(signing_secret:)
          #   An organization webhook endpoint's new signing secret.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaOrganizationWebhookEndpointSigningSecret}
          #   for more details.
          #
          #   @param signing_secret [String] The new signing secret. Deliveries are signed with it from now on, and no other
        end
      end
    end
  end
end
