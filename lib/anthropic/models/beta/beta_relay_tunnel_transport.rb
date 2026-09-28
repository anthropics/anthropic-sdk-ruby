# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRelayTunnelTransport < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :relay]
        required :type, const: :relay

        # @!attribute token
        #   The tunnel's relay token. Present only in the create response, which issues it;
        #   absent on every read. Store it: Anthropic keeps only a hash, reveal_token
        #   refuses a relay tunnel, and rotate_token is the only way to obtain a new one.
        #
        #   @return [Anthropic::Models::Beta::BetaTunnelToken, nil]
        optional :token, -> { Anthropic::Beta::BetaTunnelToken }

        # @!method initialize(token: nil, type: :relay)
        #   The tunnel is connected through Anthropic's relay. In the create response
        #   `token` is the tunnel's relay token, shown that once (only a hash is kept, so
        #   reveal_token refuses a relay tunnel and rotate_token issues a new one); reads
        #   never carry it.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaRelayTunnelTransport} for more details.
        #
        #   @param token [Anthropic::Models::Beta::BetaTunnelToken] The tunnel's relay token. Present only in the create response, which issues it;
        #
        #   @param type [Symbol, :relay]
      end
    end

    BetaRelayTunnelTransport = Beta::BetaRelayTunnelTransport
  end
end
