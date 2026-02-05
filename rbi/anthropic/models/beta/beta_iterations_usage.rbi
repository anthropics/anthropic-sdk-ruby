# typed: strong

module Anthropic
  module Models
    BetaIterationsUsage =
      T.let(Beta::BetaIterationsUsage, Anthropic::Internal::Type::Converter)

    module Beta
      # Token usage for a sampling iteration.
      module BetaIterationsUsageItem
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMessageIterationUsage,
              Anthropic::Beta::BetaCompactionIterationUsage
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaIterationsUsageItem::Variants]
          )
        end
        def self.variants
        end
      end

      BetaIterationsUsage =
        T.let(
          Anthropic::Internal::Type::ArrayOf[
            union: Anthropic::Beta::BetaIterationsUsageItem
          ],
          Anthropic::Internal::Type::Converter
        )
    end
  end
end
