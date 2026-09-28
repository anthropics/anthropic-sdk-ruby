# typed: strong

module Anthropic
  module Models
    BetaCloudflareTunnelTransport = Beta::BetaCloudflareTunnelTransport

    module Beta
      class BetaCloudflareTunnelTransport < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCloudflareTunnelTransport,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The tunnel is connected through the Cloudflare connector. Its connector token is
        # fetched with reveal_token. `type` is transitional: it reads `relay` for every
        # tunnel once the Cloudflare transport is retired.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :cloudflare)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
