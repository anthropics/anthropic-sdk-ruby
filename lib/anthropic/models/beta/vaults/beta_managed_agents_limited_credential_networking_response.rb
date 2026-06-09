# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsLimitedCredentialNetworkingResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute allowed_hosts
          #   Hostnames on which the secret will be substituted. An entry matches the request
          #   host exactly; a `*.`-prefixed entry matches any subdomain of the named domain
          #   but not the domain itself.
          #
          #   @return [Array<String>]
          required :allowed_hosts, Anthropic::Internal::Type::ArrayOf[String]

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::Type }

          # @!method initialize(allowed_hosts:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse}
          #   for more details.
          #
          #   The secret is substituted only on requests to the listed hosts.
          #
          #   @param allowed_hosts [Array<String>] Hostnames on which the secret will be substituted. An entry matches the request
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse#type
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
