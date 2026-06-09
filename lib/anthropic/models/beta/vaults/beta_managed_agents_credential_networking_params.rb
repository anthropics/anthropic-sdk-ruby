# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # Substitute the secret on any host the session's Environment network policy
        # permits egress to. The Environment's network policy is the only boundary on
        # where the secret can reach.
        module BetaManagedAgentsCredentialNetworkingParams
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Substitute the secret on any host the session's Environment network policy permits egress to. The Environment's network policy is the only boundary on where the secret can reach.
          variant :unrestricted,
                  -> { Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams }

          # Substitute the secret only on requests to the listed hosts.
          variant :limited, -> { Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams)]
        end
      end
    end
  end
end
