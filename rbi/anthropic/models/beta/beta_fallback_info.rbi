# typed: strong

module Anthropic
  module Models
    BetaFallbackInfo = Beta::BetaFallbackInfo

    module Beta
      class BetaFallbackInfo < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFallbackInfo,
              Anthropic::Internal::AnyHash
            )
          end

        # The model that will complete your prompt.
        #
        # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        # details and options.
        sig { returns(Anthropic::Model::Variants) }
        attr_accessor :model

        # Identifies one hop of a fallback transition.
        sig do
          params(model: T.any(Anthropic::Model::OrSymbol, String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The model that will complete your prompt.
          #
          # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          model:
        )
        end

        sig { override.returns({ model: Anthropic::Model::Variants }) }
        def to_hash
        end
      end
    end
  end
end
