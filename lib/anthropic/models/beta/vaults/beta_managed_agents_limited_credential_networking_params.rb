# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsLimitedCredentialNetworkingParams < Anthropic::Internal::Type::BaseModel
          # @!attribute allowed_hosts
          #   The destination hosts of the outbound requests that the credential's secret is
          #   substituted into.
          #
          #   Each entry is a bare hostname (`api.example.com`), an IPv4 address
          #   (`192.0.2.1`), or a `*.` wildcard (`*.example.com`). URLs, ports, paths, and
          #   IPv6 addresses aren't accepted. The list can have up to 16 entries.
          #
          #   @return [Array<String>]
          required :allowed_hosts, Anthropic::Internal::Type::ArrayOf[String]

          # @!attribute type
          #
          #   @return [Symbol, :limited]
          required :type, const: :limited

          # @!method initialize(allowed_hosts:, type: :limited)
          #   Substitute the secret only on requests to the listed hosts.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams}
          #   for more details.
          #
          #   @param allowed_hosts [Array<String>] The destination hosts of the outbound requests that the credential's secret is s
          #
          #   @param type [Symbol, :limited]
        end
      end
    end
  end
end
