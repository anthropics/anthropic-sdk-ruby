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

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              allowed_hosts: T::Array[String]
            ).returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsCredentialNetworkingParams::Variants
            )
          end
          def self.new(
            type:,
            # Hostnames on which the secret will be substituted. Each entry is a bare hostname
            # (`api.example.com`), an IPv4 address (`192.0.2.1`), or a `*.`-prefixed wildcard
            # (`*.example.com`). URLs, ports, paths, and IPv6 addresses are not accepted. At
            # most 16 entries.
            allowed_hosts: nil
          )
          end
        end
      end
    end
  end
end
