# typed: strong

module Anthropic
  module Models
    BetaFallbackInfoParam = Beta::BetaFallbackInfoParam

    module Beta
      class BetaFallbackInfoParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFallbackInfoParam,
              Anthropic::Internal::AnyHash
            )
          end

        # The model that will complete your prompt.
        #
        # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        # details and options.
        sig { returns(T.any(Anthropic::Model::OrSymbol, String)) }
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

        sig do
          override.returns({ model: T.any(Anthropic::Model::OrSymbol, String) })
        end
        def to_hash
        end
      end
    end
  end
end
