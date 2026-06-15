# frozen_string_literal: true

module Anthropic
  module Models
    # The model that will complete your prompt.
    #
    # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
    # details and options.
    module Model
      extend Anthropic::Internal::Type::Union

      variant const: -> { Anthropic::Models::Model::CLAUDE_FABLE_5 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_MYTHOS_5 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_8 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_7 }

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

      variant String

      # @!method self.variants
      #   @return [Array(Symbol, String)]

      define_sorbet_constant!(:Variants) do
        T.type_alias { T.any(Anthropic::Model::TaggedSymbol, String) }
      end

      # @!group

      # Next generation of intelligence for the hardest knowledge work and coding problems
      CLAUDE_FABLE_5 = :"claude-fable-5"

      # Most capable model for cybersecurity and biology research
      CLAUDE_MYTHOS_5 = :"claude-mythos-5"

      # Frontier intelligence for long-running agents and coding
      CLAUDE_OPUS_4_8 = :"claude-opus-4-8"

      # Frontier intelligence for long-running agents and coding
      CLAUDE_OPUS_4_7 = :"claude-opus-4-7"

      # New class of intelligence, strongest in coding and cybersecurity
      # @deprecated Will reach end-of-life on June 30, 2026. Please migrate to claude-mythos-5.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
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
      # @deprecated Will reach end-of-life on August 5, 2026. Please migrate to a newer model. Visit
      # https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_OPUS_4_1 = :"claude-opus-4-1"

      # Exceptional model for specialized complex tasks
      # @deprecated Will reach end-of-life on August 5, 2026. Please migrate to a newer model. Visit
      # https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_OPUS_4_1_20250805 = :"claude-opus-4-1-20250805"

      # @!endgroup
    end
  end
end
