# typed: strong

module Anthropic
  module Models
    # The model that will complete your prompt.\n\nSee
    # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
    # details and options.
    module Model
      extend Anthropic::Internal::Type::Union

      Variants = T.type_alias { T.any(Anthropic::Model::TaggedSymbol, String) }

      sig { override.returns(T::Array[Anthropic::Model::Variants]) }
      def self.variants
      end

      TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Model) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      # Frontier intelligence for long-running agents and coding
      CLAUDE_OPUS_4_7 =
        T.let(:"claude-opus-4-7", Anthropic::Model::TaggedSymbol)

      # New class of intelligence, strongest in coding and cybersecurity
      CLAUDE_MYTHOS_PREVIEW =
        T.let(:"claude-mythos-preview", Anthropic::Model::TaggedSymbol)

      # Frontier intelligence for long-running agents and coding
      CLAUDE_OPUS_4_6 =
        T.let(:"claude-opus-4-6", Anthropic::Model::TaggedSymbol)

      # Best combination of speed and intelligence
      CLAUDE_SONNET_4_6 =
        T.let(:"claude-sonnet-4-6", Anthropic::Model::TaggedSymbol)

      # Fastest model with near-frontier intelligence
      CLAUDE_HAIKU_4_5 =
        T.let(:"claude-haiku-4-5", Anthropic::Model::TaggedSymbol)

      # Fastest model with near-frontier intelligence
      CLAUDE_HAIKU_4_5_20251001 =
        T.let(:"claude-haiku-4-5-20251001", Anthropic::Model::TaggedSymbol)

      # Premium model combining maximum intelligence with practical performance
      CLAUDE_OPUS_4_5 =
        T.let(:"claude-opus-4-5", Anthropic::Model::TaggedSymbol)

      # Premium model combining maximum intelligence with practical performance
      CLAUDE_OPUS_4_5_20251101 =
        T.let(:"claude-opus-4-5-20251101", Anthropic::Model::TaggedSymbol)

      # High-performance model for agents and coding
      CLAUDE_SONNET_4_5 =
        T.let(:"claude-sonnet-4-5", Anthropic::Model::TaggedSymbol)

      # High-performance model for agents and coding
      CLAUDE_SONNET_4_5_20250929 =
        T.let(:"claude-sonnet-4-5-20250929", Anthropic::Model::TaggedSymbol)

      # Exceptional model for specialized complex tasks
      CLAUDE_OPUS_4_1 =
        T.let(:"claude-opus-4-1", Anthropic::Model::TaggedSymbol)

      # Exceptional model for specialized complex tasks
      CLAUDE_OPUS_4_1_20250805 =
        T.let(:"claude-opus-4-1-20250805", Anthropic::Model::TaggedSymbol)

      # Powerful model for complex tasks
      CLAUDE_OPUS_4_0 =
        T.let(:"claude-opus-4-0", Anthropic::Model::TaggedSymbol)

      # Powerful model for complex tasks
      CLAUDE_OPUS_4_20250514 =
        T.let(:"claude-opus-4-20250514", Anthropic::Model::TaggedSymbol)

      # High-performance model with extended thinking
      CLAUDE_SONNET_4_0 =
        T.let(:"claude-sonnet-4-0", Anthropic::Model::TaggedSymbol)

      # High-performance model with extended thinking
      CLAUDE_SONNET_4_20250514 =
        T.let(:"claude-sonnet-4-20250514", Anthropic::Model::TaggedSymbol)

      # Fast and cost-effective model
      CLAUDE_3_HAIKU_20240307 =
        T.let(:"claude-3-haiku-20240307", Anthropic::Model::TaggedSymbol)
    end
  end
end
