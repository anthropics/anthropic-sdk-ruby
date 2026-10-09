# typed: strong

module Anthropic
  module Models
    BetaFallbacksParam = Beta::BetaFallbacksParam

    module Beta
      # Opt-in server-side retry on one or more substitute models when the requested
      # model declines for policy reasons. Tried in order: if the first entry also
      # declines, the second is tried, and so on. Some models don't support fallbacks;
      # on those models, a list of fallback models returns a 400 error. See
      # [Server-side fallback](https://platform.claude.com/docs/en/build-with-claude/refusals-and-fallback#server-side-fallback).
      # The string "default" requests the requested model's server-defined default
      # fallback configuration. On a model that doesn't support fallbacks, the request
      # runs on the requested model alone, so a declined request stays declined.
      module BetaFallbacksParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Symbol, T::Array[Anthropic::Beta::BetaFallbackParam])
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
