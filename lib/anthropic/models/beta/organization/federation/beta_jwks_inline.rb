# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaJWKSInline < Anthropic::Internal::Type::BaseModel
            # @!attribute keys
            #   Inline JWK objects.
            #
            #   @return [Array<Hash{Symbol=>Object}>]
            required :keys,
                     Anthropic::Internal::Type::ArrayOf[Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]]

            # @!attribute type
            #
            #   @return [Symbol, :inline]
            required :type, const: :inline

            # @!method initialize(keys:, type: :inline)
            #   JWKS supplied directly; no network fetch.
            #
            #   @param keys [Array<Hash{Symbol=>Object}>] Inline JWK objects.
            #
            #   @param type [Symbol, :inline]
          end
        end
      end
    end
  end
end
