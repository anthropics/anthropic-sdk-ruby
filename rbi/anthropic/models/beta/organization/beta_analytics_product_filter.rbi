# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Publicly documented product surfaces. `claude-tag` is Claude Tag, the Claude
        # product in Slack. `chat_cowork_unified` is Chat and Cowork unified, Cowork's
        # features inside claude.ai chat: chat and Cowork usage by a member who has it
        # turned on is reported under this value instead of `chat` or `cowork`. It is
        # accepted as a filter only on deployments that offer Chat and Cowork unified.
        module BetaAnalyticsProductFilter
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsProductFilter
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CHAT =
            T.let(
              :chat,
              Anthropic::Beta::Organization::BetaAnalyticsProductFilter::TaggedSymbol
            )
          CHAT_COWORK_UNIFIED =
            T.let(
              :chat_cowork_unified,
              Anthropic::Beta::Organization::BetaAnalyticsProductFilter::TaggedSymbol
            )
          CLAUDE_TAG =
            T.let(
              :"claude-tag",
              Anthropic::Beta::Organization::BetaAnalyticsProductFilter::TaggedSymbol
            )
          CLAUDE_CODE =
            T.let(
              :claude_code,
              Anthropic::Beta::Organization::BetaAnalyticsProductFilter::TaggedSymbol
            )
          CLAUDE_DESIGN =
            T.let(
              :claude_design,
              Anthropic::Beta::Organization::BetaAnalyticsProductFilter::TaggedSymbol
            )
          CLAUDE_IN_CHROME =
            T.let(
              :claude_in_chrome,
              Anthropic::Beta::Organization::BetaAnalyticsProductFilter::TaggedSymbol
            )
          COWORK =
            T.let(
              :cowork,
              Anthropic::Beta::Organization::BetaAnalyticsProductFilter::TaggedSymbol
            )
          OFFICE_AGENT =
            T.let(
              :office_agent,
              Anthropic::Beta::Organization::BetaAnalyticsProductFilter::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsProductFilter::TaggedSymbol
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
