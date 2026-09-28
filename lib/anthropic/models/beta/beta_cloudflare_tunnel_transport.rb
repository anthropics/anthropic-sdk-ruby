# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCloudflareTunnelTransport < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :cloudflare]
        required :type, const: :cloudflare

        # @!method initialize(type: :cloudflare)
        #   The tunnel is connected through the Cloudflare connector. Its connector token is
        #   fetched with reveal_token. `type` is transitional: it reads `relay` for every
        #   tunnel once the Cloudflare transport is retired.
        #
        #   @param type [Symbol, :cloudflare]
      end
    end

    BetaCloudflareTunnelTransport = Beta::BetaCloudflareTunnelTransport
  end
end
