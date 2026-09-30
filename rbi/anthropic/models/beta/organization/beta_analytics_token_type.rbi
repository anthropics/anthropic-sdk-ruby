# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsTokenType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsTokenType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CACHE_CREATION_EPHEMERAL_1H_INPUT_TOKENS =
            T.let(
              :"cache_creation.ephemeral_1h_input_tokens",
              Anthropic::Beta::Organization::BetaAnalyticsTokenType::TaggedSymbol
            )
          CACHE_CREATION_EPHEMERAL_5M_INPUT_TOKENS =
            T.let(
              :"cache_creation.ephemeral_5m_input_tokens",
              Anthropic::Beta::Organization::BetaAnalyticsTokenType::TaggedSymbol
            )
          CACHE_READ_INPUT_TOKENS =
            T.let(
              :cache_read_input_tokens,
              Anthropic::Beta::Organization::BetaAnalyticsTokenType::TaggedSymbol
            )
          OUTPUT_TOKENS =
            T.let(
              :output_tokens,
              Anthropic::Beta::Organization::BetaAnalyticsTokenType::TaggedSymbol
            )
          UNCACHED_INPUT_TOKENS =
            T.let(
              :uncached_input_tokens,
              Anthropic::Beta::Organization::BetaAnalyticsTokenType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsTokenType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
