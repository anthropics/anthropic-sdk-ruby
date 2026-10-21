# typed: strong

module Anthropic
  module Models
    BetaMessageContentParam = Beta::BetaMessageContentParam

    module Beta
      module BetaMessageContentParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              String,
              T::Array[Anthropic::Beta::BetaContentBlockParam::Variants]
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaMessageContentParam::Variants]
          )
        end
        def self.variants
        end

        BetaContentBlockParamArray =
          T.let(
            Anthropic::Internal::Type::ArrayOf[
              union: Anthropic::Beta::BetaContentBlockParam
            ],
            Anthropic::Internal::Type::Converter
          )
      end
    end
  end
end
