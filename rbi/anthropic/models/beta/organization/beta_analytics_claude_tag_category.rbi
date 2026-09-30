# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsClaudeTagCategory
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DM =
            T.let(
              :dm,
              Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::TaggedSymbol
            )
          ENGAGED =
            T.let(
              :engaged,
              Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::TaggedSymbol
            )
          MONITORING =
            T.let(
              :monitoring,
              Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::TaggedSymbol
            )
          PROACTIVE =
            T.let(
              :proactive,
              Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::TaggedSymbol
            )
          SCHEDULED =
            T.let(
              :scheduled,
              Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::TaggedSymbol
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
