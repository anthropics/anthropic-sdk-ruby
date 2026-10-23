# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsFederatedActorOIDCProvider < Anthropic::Internal::Type::BaseModel
          # @!attribute issuer
          #   The federation issuer's URL.
          #
          #   @return [String, nil]
          required :issuer, String, nil?: true

          # @!attribute type
          #
          #   @return [Symbol, :oidc]
          required :type, const: :oidc

          # @!method initialize(issuer:, type: :oidc)
          #   @param issuer [String, nil] The federation issuer's URL.
          #
          #   @param type [Symbol, :oidc]
        end
      end
    end
  end
end
