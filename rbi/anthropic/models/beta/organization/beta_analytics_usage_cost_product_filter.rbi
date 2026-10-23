# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Publicly documented product surfaces. `claude_tag` is Claude Tag, the Claude
        # product in Slack. `chat_cowork_unified` is Chat and Cowork unified, Cowork's
        # features inside claude.ai chat: chat and Cowork usage by a member who has it
        # turned on is reported under this value instead of `chat` or `cowork`. It is
        # accepted as a filter only on deployments that offer Chat and Cowork unified.
        module BetaAnalyticsUsageCostProductFilter
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CHAT =
            T.let(
              :chat,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          CHAT_COWORK_UNIFIED =
            T.let(
              :chat_cowork_unified,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          CLAUDE_CODE =
            T.let(
              :claude_code,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          CLAUDE_CONSOLE =
            T.let(
              :claude_console,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          CLAUDE_DESIGN =
            T.let(
              :claude_design,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          CLAUDE_IN_CHROME =
            T.let(
              :claude_in_chrome,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          CLAUDE_TAG =
            T.let(
              :claude_tag,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          COWORK =
            T.let(
              :cowork,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          MANAGED_AGENTS_API =
            T.let(
              :managed_agents_api,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          MESSAGE_BATCHES_API =
            T.let(
              :message_batches_api,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          MESSAGES_API =
            T.let(
              :messages_api,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )
          OFFICE_AGENT =
            T.let(
              :office_agent,
              Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::TaggedSymbol
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
