# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        # Substitute the secret on any host the session's Environment network policy
        # permits egress to. The Environment's network policy is the only boundary on
        # where the secret can reach.
        module BetaManagedAgentsCredentialNetworkingParams
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams,
                Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Vaults::BetaManagedAgentsCredentialNetworkingParams::Variants
              ]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
