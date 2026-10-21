# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsLimitedCredentialNetworkingResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute allowed_hosts
          #   The destination hosts of the outbound requests that the credential's secret is
          #   substituted into.
          #
          #   An entry matches the request host exactly. An entry such as `*.example.com`
          #   matches any subdomain of `example.com` but not `example.com` itself.
          #
          #   @return [Array<String>]
          required :allowed_hosts, Anthropic::Internal::Type::ArrayOf[String]

          # @!attribute type
          #
          #   @return [Symbol, :limited]
          required :type, const: :limited

          # @!method initialize(allowed_hosts:, type: :limited)
          #   The secret is substituted only on requests to the listed hosts.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse}
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
