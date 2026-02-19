# frozen_string_literal: true

module Anthropic
  module Models
    # The model that will complete your prompt.\n\nSee
    # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
    # details and options.
    module Model
      extend Anthropic::Internal::Type::Union

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_6 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_SONNET_4_6 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_5_20251101 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_5 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_3_7_SONNET_LATEST }

      variant const: -> { Anthropic::Models::Model::CLAUDE_3_7_SONNET_20250219 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_3_5_HAIKU_LATEST }

      variant const: -> { Anthropic::Models::Model::CLAUDE_3_5_HAIKU_20241022 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_HAIKU_4_5 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_HAIKU_4_5_20251001 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_SONNET_4_20250514 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_SONNET_4_0 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_4_SONNET_20250514 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_SONNET_4_5 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_SONNET_4_5_20250929 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_0 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_20250514 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_4_OPUS_20250514 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_OPUS_4_1_20250805 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_3_OPUS_LATEST }

      variant const: -> { Anthropic::Models::Model::CLAUDE_3_OPUS_20240229 }

      variant const: -> { Anthropic::Models::Model::CLAUDE_3_HAIKU_20240307 }

      variant String

      # @!method self.variants
      #   @return [Array(Symbol, String)]

      define_sorbet_constant!(:Variants) do
        T.type_alias { T.any(Anthropic::Model::TaggedSymbol, String) }
      end

      # @!group

      # Most intelligent model for building agents and coding
      CLAUDE_OPUS_4_6 = :"claude-opus-4-6"

      # Frontier intelligence at scale — built for coding, agents, and enterprise workflows
      CLAUDE_SONNET_4_6 = :"claude-sonnet-4-6"

      # Premium model combining maximum intelligence with practical performance
      CLAUDE_OPUS_4_5_20251101 = :"claude-opus-4-5-20251101"

      # Premium model combining maximum intelligence with practical performance
      CLAUDE_OPUS_4_5 = :"claude-opus-4-5"

      # High-performance model with early extended thinking
      # @deprecated Will reach end-of-life on February 19th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_3_7_SONNET_LATEST = :"claude-3-7-sonnet-latest"

      # High-performance model with early extended thinking
      # @deprecated Will reach end-of-life on February 19th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_3_7_SONNET_20250219 = :"claude-3-7-sonnet-20250219"

      # Fastest and most compact model for near-instant responsiveness
      # @deprecated Will reach end-of-life on February 19th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_3_5_HAIKU_LATEST = :"claude-3-5-haiku-latest"

      # Our fastest model
      # @deprecated Will reach end-of-life on February 19th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_3_5_HAIKU_20241022 = :"claude-3-5-haiku-20241022"

      # Hybrid model, capable of near-instant responses and extended thinking
      CLAUDE_HAIKU_4_5 = :"claude-haiku-4-5"

      # Hybrid model, capable of near-instant responses and extended thinking
      CLAUDE_HAIKU_4_5_20251001 = :"claude-haiku-4-5-20251001"

      # High-performance model with extended thinking
      CLAUDE_SONNET_4_20250514 = :"claude-sonnet-4-20250514"

      # High-performance model with extended thinking
      CLAUDE_SONNET_4_0 = :"claude-sonnet-4-0"

      # High-performance model with extended thinking
      CLAUDE_4_SONNET_20250514 = :"claude-4-sonnet-20250514"

      # Our best model for real-world agents and coding
      CLAUDE_SONNET_4_5 = :"claude-sonnet-4-5"

      # Our best model for real-world agents and coding
      CLAUDE_SONNET_4_5_20250929 = :"claude-sonnet-4-5-20250929"

      # Our most capable model
      CLAUDE_OPUS_4_0 = :"claude-opus-4-0"

      # Our most capable model
      CLAUDE_OPUS_4_20250514 = :"claude-opus-4-20250514"

      # Our most capable model
      CLAUDE_4_OPUS_20250514 = :"claude-4-opus-20250514"

      # Our most capable model
      CLAUDE_OPUS_4_1_20250805 = :"claude-opus-4-1-20250805"

      # Excels at writing and complex tasks
      # @deprecated Will reach end-of-life on January 5th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_3_OPUS_LATEST = :"claude-3-opus-latest"

      # Excels at writing and complex tasks
      # @deprecated Will reach end-of-life on January 5th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_3_OPUS_20240229 = :"claude-3-opus-20240229"

      # Our previous most fast and cost-effective
      # @deprecated Will reach end-of-life on April 20th, 2026. Please migrate to a newer model.
      # Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      # information.
      CLAUDE_3_HAIKU_20240307 = :"claude-3-haiku-20240307"

      # @!endgroup
    end
  end
end
