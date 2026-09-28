# typed: strong

module Anthropic
  module Models
    BetaRelayTunnelTransport = Beta::BetaRelayTunnelTransport

    module Beta
      class BetaRelayTunnelTransport < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRelayTunnelTransport,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The tunnel's relay token. Present only in the create response, which issues it;
        # absent on every read. Store it: Anthropic keeps only a hash, reveal_token
        # refuses a relay tunnel, and rotate_token is the only way to obtain a new one.
        sig { returns(T.nilable(Anthropic::Beta::BetaTunnelToken)) }
        attr_reader :token

        sig { params(token: Anthropic::Beta::BetaTunnelToken::OrHash).void }
        attr_writer :token

        # The tunnel is connected through Anthropic's relay. In the create response
        # `token` is the tunnel's relay token, shown that once (only a hash is kept, so
        # reveal_token refuses a relay tunnel and rotate_token issues a new one); reads
        # never carry it.
        sig do
          params(
            token: Anthropic::Beta::BetaTunnelToken::OrHash,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The tunnel's relay token. Present only in the create response, which issues it;
          # absent on every read. Store it: Anthropic keeps only a hash, reveal_token
          # refuses a relay tunnel, and rotate_token is the only way to obtain a new one.
          token: nil,
          type: :relay
        )
        end

        sig do
          override.returns(
            { type: Symbol, token: Anthropic::Beta::BetaTunnelToken }
          )
        end
        def to_hash
        end
      end
    end
  end
end
