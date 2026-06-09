# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsLimitedCredentialNetworkingParams < Anthropic::Internal::Type::BaseModel
          # @!attribute allowed_hosts
          #   Hostnames on which the secret will be substituted. Each entry is a bare hostname
          #   (`api.example.com`), an IPv4 address (`192.0.2.1`), or a `*.`-prefixed wildcard
          #   (`*.example.com`). URLs, ports, paths, and IPv6 addresses are not accepted. At
          #   most 16 entries.
          #
          #   @return [Array<String>]
          required :allowed_hosts, Anthropic::Internal::Type::ArrayOf[String]

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::Type }

          # @!method initialize(allowed_hosts:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams}
          #   for more details.
          #
          #   Substitute the secret only on requests to the listed hosts.
          #
          #   @param allowed_hosts [Array<String>] Hostnames on which the secret will be substituted. Each entry is a bare hostname
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams#type
          module Type
            extend Anthropic::Internal::Type::Enum

            LIMITED = :limited

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
