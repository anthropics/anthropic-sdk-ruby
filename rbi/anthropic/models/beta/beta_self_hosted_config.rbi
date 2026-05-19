# typed: strong

module Anthropic
  module Models
    BetaSelfHostedConfig = Beta::BetaSelfHostedConfig

    module Beta
      class BetaSelfHostedConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaSelfHostedConfig,
              Anthropic::Internal::AnyHash
            )
          end

        # Environment type
        sig { returns(Symbol) }
        attr_accessor :type

        # Configuration for self-hosted environments.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(
          # Environment type
          type: :self_hosted
        )
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
