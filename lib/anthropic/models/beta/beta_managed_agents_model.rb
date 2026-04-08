# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # The model that will power your agent.\n\nSee
      # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      # details and options.
      module BetaManagedAgentsModel
        extend Anthropic::Internal::Type::Union

        variant const: -> { Anthropic::Models::Beta::BetaManagedAgentsModel::CLAUDE_OPUS_4_6 }

        variant const: -> { Anthropic::Models::Beta::BetaManagedAgentsModel::CLAUDE_SONNET_4_6 }

        variant const: -> { Anthropic::Models::Beta::BetaManagedAgentsModel::CLAUDE_HAIKU_4_5 }

        variant const: -> { Anthropic::Models::Beta::BetaManagedAgentsModel::CLAUDE_HAIKU_4_5_20251001 }

        variant const: -> { Anthropic::Models::Beta::BetaManagedAgentsModel::CLAUDE_OPUS_4_5 }

        variant const: -> { Anthropic::Models::Beta::BetaManagedAgentsModel::CLAUDE_OPUS_4_5_20251101 }

        variant const: -> { Anthropic::Models::Beta::BetaManagedAgentsModel::CLAUDE_SONNET_4_5 }

        variant const: -> { Anthropic::Models::Beta::BetaManagedAgentsModel::CLAUDE_SONNET_4_5_20250929 }

        variant String

        # @!method self.variants
        #   @return [Array(Symbol, String)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(Anthropic::Beta::BetaManagedAgentsModel::TaggedSymbol, String) }
        end

        # @!group

        # Most intelligent model for building agents and coding
        CLAUDE_OPUS_4_6 = :"claude-opus-4-6"

        # Best combination of speed and intelligence
        CLAUDE_SONNET_4_6 = :"claude-sonnet-4-6"

        # Fastest model with near-frontier intelligence
        CLAUDE_HAIKU_4_5 = :"claude-haiku-4-5"

        # Fastest model with near-frontier intelligence
        CLAUDE_HAIKU_4_5_20251001 = :"claude-haiku-4-5-20251001"

        # Premium model combining maximum intelligence with practical performance
        CLAUDE_OPUS_4_5 = :"claude-opus-4-5"

        # Premium model combining maximum intelligence with practical performance
        CLAUDE_OPUS_4_5_20251101 = :"claude-opus-4-5-20251101"

        # High-performance model for agents and coding
        CLAUDE_SONNET_4_5 = :"claude-sonnet-4-5"

        # High-performance model for agents and coding
        CLAUDE_SONNET_4_5_20250929 = :"claude-sonnet-4-5-20250929"

        # @!endgroup
      end
    end

    BetaManagedAgentsModel = Beta::BetaManagedAgentsModel
  end
end
