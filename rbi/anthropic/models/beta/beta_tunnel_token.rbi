# typed: strong

module Anthropic
  module Models
    BetaTunnelToken = Beta::BetaTunnelToken

    module Beta
      class BetaTunnelToken < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTunnelToken,
              Anthropic::Internal::AnyHash
            )
          end

        # Stable identifier for the current token value. Changes when the token is
        # rotated.
        sig { returns(String) }
        attr_accessor :id

        # The connector token used to run the tunnel. Treat as a credential.
        sig { returns(String) }
        attr_accessor :tunnel_token

        sig { returns(Symbol) }
        attr_accessor :type

        # A tunnel's connector token.
        sig do
          params(id: String, tunnel_token: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # Stable identifier for the current token value. Changes when the token is
          # rotated.
          id:,
          # The connector token used to run the tunnel. Treat as a credential.
          tunnel_token:,
          type: :tunnel_token
        )
        end

        sig do
          override.returns({ id: String, tunnel_token: String, type: Symbol })
        end
        def to_hash
        end
      end
    end
  end
end
