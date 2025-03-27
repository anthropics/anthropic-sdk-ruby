# typed: strong

module Anthropic
  module Models
    # The model that will complete your prompt.\n\nSee
    #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
    #   details and options.
    module Model
      extend Anthropic::Union

      sig { override.returns([Anthropic::Models::Model::OrSymbol, String]) }
      def self.variants
      end

      TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::Model) }
      OrSymbol = T.type_alias { T.any(Symbol, Anthropic::Models::Model::TaggedSymbol) }

      # Our most intelligent model
      CLAUDE_3_7_SONNET_LATEST = T.let(:"claude-3-7-sonnet-latest", Anthropic::Models::Model::TaggedSymbol)

      # Our most intelligent model
      CLAUDE_3_7_SONNET_20250219 = T.let(:"claude-3-7-sonnet-20250219", Anthropic::Models::Model::TaggedSymbol)

      # Fastest and most compact model for near-instant responsiveness
      CLAUDE_3_5_HAIKU_LATEST = T.let(:"claude-3-5-haiku-latest", Anthropic::Models::Model::TaggedSymbol)

      # Our fastest model
      CLAUDE_3_5_HAIKU_20241022 = T.let(:"claude-3-5-haiku-20241022", Anthropic::Models::Model::TaggedSymbol)

      # Our previous most intelligent model
      CLAUDE_3_5_SONNET_LATEST = T.let(:"claude-3-5-sonnet-latest", Anthropic::Models::Model::TaggedSymbol)

      # Our previous most intelligent model
      CLAUDE_3_5_SONNET_20241022 = T.let(:"claude-3-5-sonnet-20241022", Anthropic::Models::Model::TaggedSymbol)

      CLAUDE_3_5_SONNET_20240620 = T.let(:"claude-3-5-sonnet-20240620", Anthropic::Models::Model::TaggedSymbol)

      # Excels at writing and complex tasks
      CLAUDE_3_OPUS_LATEST = T.let(:"claude-3-opus-latest", Anthropic::Models::Model::TaggedSymbol)

      # Excels at writing and complex tasks
      CLAUDE_3_OPUS_20240229 = T.let(:"claude-3-opus-20240229", Anthropic::Models::Model::TaggedSymbol)

      # Balance of speed and intelligence
      CLAUDE_3_SONNET_20240229 = T.let(:"claude-3-sonnet-20240229", Anthropic::Models::Model::TaggedSymbol)

      # Our previous most fast and cost-effective
      CLAUDE_3_HAIKU_20240307 = T.let(:"claude-3-haiku-20240307", Anthropic::Models::Model::TaggedSymbol)

      CLAUDE_2_1 = T.let(:"claude-2.1", Anthropic::Models::Model::TaggedSymbol)

      CLAUDE_2_0 = T.let(:"claude-2.0", Anthropic::Models::Model::TaggedSymbol)
    end
  end
end
