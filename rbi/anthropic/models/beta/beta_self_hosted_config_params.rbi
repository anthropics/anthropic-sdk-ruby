# typed: strong

module Anthropic
  module Models
    BetaSelfHostedConfigParams = Beta::BetaSelfHostedConfigParams

    module Beta
      class BetaSelfHostedConfigParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaSelfHostedConfigParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Environment type
        sig { returns(Symbol) }
        attr_accessor :type

        # Request params for `self_hosted` environment configuration.
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
