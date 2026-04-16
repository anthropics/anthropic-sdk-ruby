# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsModel = Beta::BetaManagedAgentsModel

    module Beta
      # The model that will power your agent.\n\nSee
      # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      # details and options.
      module BetaManagedAgentsModel
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol, String)
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsModel::Variants]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaManagedAgentsModel)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Frontier intelligence for long-running agents and coding
        CLAUDE_OPUS_4_7 =
          T.let(
            :"claude-opus-4-7",
            Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol
          )

        # Most intelligent model for building agents and coding
        CLAUDE_OPUS_4_6 =
          T.let(
            :"claude-opus-4-6",
            Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol
          )

        # Best combination of speed and intelligence
        CLAUDE_SONNET_4_6 =
          T.let(
            :"claude-sonnet-4-6",
            Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol
          )

        # Fastest model with near-frontier intelligence
        CLAUDE_HAIKU_4_5 =
          T.let(
            :"claude-haiku-4-5",
            Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol
          )

        # Fastest model with near-frontier intelligence
        CLAUDE_HAIKU_4_5_20251001 =
          T.let(
            :"claude-haiku-4-5-20251001",
            Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol
          )

        # Premium model combining maximum intelligence with practical performance
        CLAUDE_OPUS_4_5 =
          T.let(
            :"claude-opus-4-5",
            Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol
          )

        # Premium model combining maximum intelligence with practical performance
        CLAUDE_OPUS_4_5_20251101 =
          T.let(
            :"claude-opus-4-5-20251101",
            Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol
          )

        # High-performance model for agents and coding
        CLAUDE_SONNET_4_5 =
          T.let(
            :"claude-sonnet-4-5",
            Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol
          )

        # High-performance model for agents and coding
        CLAUDE_SONNET_4_5_20250929 =
          T.let(
            :"claude-sonnet-4-5-20250929",
            Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol
          )
      end
    end
  end
end
