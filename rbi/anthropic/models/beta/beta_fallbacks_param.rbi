# typed: strong

module Anthropic
  module Models
    BetaFallbacksParam = Beta::BetaFallbacksParam

    module Beta
      # Opt-in server-side retry on one or more substitute models when the requested
      # model declines for policy reasons. Tried in order: if the first entry also
      # declines, the second is tried, and so on. The string "default" requests the
      # requested model's server-defined default fallback configuration.
      module BetaFallbacksParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(T::Array[Anthropic::Beta::BetaFallbackParam], Symbol)
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaFallbacksParam::Variants]
          )
        end
        def self.variants
        end

        BetaFallbackParamArray =
          T.let(
            Anthropic::Internal::Type::ArrayOf[
              Anthropic::Beta::BetaFallbackParam
            ],
            Anthropic::Internal::Type::Converter
          )
      end
    end
  end
end
