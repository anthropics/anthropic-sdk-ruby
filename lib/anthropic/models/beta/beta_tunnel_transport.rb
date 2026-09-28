# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # How traffic reaches a tunnel: `{"type": "cloudflare"}` or `{"type": "relay"}`.
      # In the create response a `relay` tunnel's transport also carries its relay
      # `token`; reads never carry a token.
      module BetaTunnelTransport
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The tunnel is connected through the Cloudflare connector. Its connector token is fetched with reveal_token. `type` is transitional: it reads `relay` for every tunnel once the Cloudflare transport is retired.
        variant :cloudflare, -> { Anthropic::Beta::BetaCloudflareTunnelTransport }

        # The tunnel is connected through Anthropic's relay. In the create response `token` is the tunnel's relay token, shown that once (only a hash is kept, so reveal_token refuses a relay tunnel and rotate_token issues a new one); reads never carry it.
        variant :relay, -> { Anthropic::Beta::BetaRelayTunnelTransport }

        module Type
          extend Anthropic::Internal::Type::Enum

          CLOUDFLARE = :cloudflare
          RELAY = :relay

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCloudflareTunnelTransport, Anthropic::Models::Beta::BetaRelayTunnelTransport)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaTunnelTransport} for more details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaTunnelTransport::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Anthropic::Models::Beta::BetaTunnelToken] :token The tunnel's relay token. Present only in the create response, which issues it;
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaCloudflareTunnelTransport, Anthropic::Models::Beta::BetaRelayTunnelTransport]
        def self.new(type:, **args)
          case type.to_sym
          when :cloudflare
            Anthropic::Beta::BetaCloudflareTunnelTransport.new(**args)
          when :relay
            Anthropic::Beta::BetaRelayTunnelTransport.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaTunnelTransport = Beta::BetaTunnelTransport
  end
end
