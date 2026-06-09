# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsUnrestrictedCredentialNetworkingResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::Type }

          # @!method initialize(type:)
          #   The secret is substituted on any host the session's Environment network policy
          #   permits egress to.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse#type
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
