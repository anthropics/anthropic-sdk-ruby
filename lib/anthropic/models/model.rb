# frozen_string_literal: true

module Anthropic
  module Models
    # The model that will complete your prompt.\n\nSee
    # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
    # details and options.
    module Model
      extend Anthropic::Internal::Type::Union

      variant const: -> { Anthropic::Models::Model::CLAUDE_MYTHOS_PREVIEW }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_6 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_SONNET_4_6 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_HAIKU_4_5 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_HAIKU_4_5_20251001 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_5 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_5_20251101 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_SONNET_4_5 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_SONNET_4_5_20250929 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_1 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_1_20250805 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_0 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_20250514 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_SONNET_4_0 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_SONNET_4_20250514 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_3_HAIKU_20240307 }

      variant String

      # @!method self.variants
      #   @return [Array(Symbol, String)]

      define_sorbet_constant!(:Variants) do
        T.type_alias { T.any(Anthropic::Model::TaggedSymbol, String) }
      end

      # @!group

      # New class of intelligence, strongest in coding and cybersecurity
      CLAUDE_MYTHOS_PREVIEW = :"claude-mythos-preview"

      # Frontier intelligence for long-running agents and coding
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

      # Exceptional model for specialized complex tasks
      CLAUDE_OPUS_4_1 = :"claude-opus-4-1"

      # Exceptional model for specialized complex tasks
      CLAUDE_OPUS_4_1_20250805 = :"claude-opus-4-1-20250805"

      # Powerful model for complex tasks
      # @deprecated Will reach end-of-life on June 15th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_OPUS_4_0 = :"claude-opus-4-0"

      # Powerful model for complex tasks
      # @deprecated Will reach end-of-life on June 15th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_OPUS_4_20250514 = :"claude-opus-4-20250514"

      # High-performance model with extended thinking
      # @deprecated Will reach end-of-life on June 15th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_SONNET_4_0 = :"claude-sonnet-4-0"

      # High-performance model with extended thinking
      # @deprecated Will reach end-of-life on June 15th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_SONNET_4_20250514 = :"claude-sonnet-4-20250514"

      # Fast and cost-effective model
      # @deprecated Will reach end-of-life on April 20th, 2026. Please migrate to claude-haiku-4-5.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_3_HAIKU_20240307 = :"claude-3-haiku-20240307"

      # @!endgroup
    end
  end
end
