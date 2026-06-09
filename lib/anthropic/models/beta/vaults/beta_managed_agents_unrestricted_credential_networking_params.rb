# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsUnrestrictedCredentialNetworkingParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::Type }

          # @!method initialize(type:)
          #   Substitute the secret on any host the session's Environment network policy
          #   permits egress to. The Environment's network policy is the only boundary on
          #   where the secret can reach.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams#type
          module Type
            extend Anthropic::Internal::Type::Enum

            UNRESTRICTED = :unrestricted

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
