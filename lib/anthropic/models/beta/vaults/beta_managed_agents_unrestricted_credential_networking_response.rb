# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsUnrestrictedCredentialNetworkingResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :unrestricted]
          required :type, const: :unrestricted

          # @!method initialize(type: :unrestricted)
          #   The secret is substituted on any host the session's Environment network policy
          #   permits egress to.
          #
          #   @param type [Symbol, :unrestricted]
        end
      end
    end
  end
end
