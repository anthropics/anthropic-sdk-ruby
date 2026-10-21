# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsUnrestrictedCredentialNetworkingParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :unrestricted]
          required :type, const: :unrestricted

          # @!method initialize(type: :unrestricted)
          #   Substitute the secret on any host the session's Environment network policy
          #   permits egress to. The Environment's network policy is the only boundary on
          #   where the secret can reach.
          #
          #   @param type [Symbol, :unrestricted]
        end
      end
    end
  end
end
