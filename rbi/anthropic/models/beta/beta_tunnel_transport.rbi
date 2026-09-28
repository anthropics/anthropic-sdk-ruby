# typed: strong

module Anthropic
  module Models
    BetaTunnelTransport = Beta::BetaTunnelTransport

    module Beta
      # How traffic reaches a tunnel: `{"type": "cloudflare"}` or `{"type": "relay"}`.
      # In the create response a `relay` tunnel's transport also carries its relay
      # `token`; reads never carry a token.
      module BetaTunnelTransport
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCloudflareTunnelTransport,
              Anthropic::Beta::BetaRelayTunnelTransport
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaTunnelTransport::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CLOUDFLARE =
            T.let(
              :cloudflare,
              Anthropic::Beta::BetaTunnelTransport::Type::TaggedSymbol
            )
          RELAY =
            T.let(
              :relay,
              Anthropic::Beta::BetaTunnelTransport::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaTunnelTransport::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaTunnelTransport::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: Anthropic::Beta::BetaTunnelTransport::Type::OrSymbol,
            token: Anthropic::Beta::BetaTunnelToken::OrHash
          ).returns(Anthropic::Beta::BetaTunnelTransport::Variants)
        end
        def self.new(
          type:,
          # The tunnel's relay token. Present only in the create response, which issues it;
          # absent on every read. Store it: Anthropic keeps only a hash, reveal_token
          # refuses a relay tunnel, and rotate_token is the only way to obtain a new one.
          token: nil
        )
        end
      end
    end
  end
end
