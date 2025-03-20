# typed: strong

module Anthropic
  module Models
    module AnthropicBeta
      extend Anthropic::Union

      Variants = type_template(:out) { {fixed: T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)} }

      TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::AnthropicBeta) }
      OrSymbol = T.type_alias { T.any(Symbol, Anthropic::Models::AnthropicBeta::TaggedSymbol) }

      MESSAGE_BATCHES_2024_09_24 =
        T.let(:"message-batches-2024-09-24", Anthropic::Models::AnthropicBeta::TaggedSymbol)
      PROMPT_CACHING_2024_07_31 =
        T.let(:"prompt-caching-2024-07-31", Anthropic::Models::AnthropicBeta::TaggedSymbol)
      COMPUTER_USE_2024_10_22 =
        T.let(:"computer-use-2024-10-22", Anthropic::Models::AnthropicBeta::TaggedSymbol)
      COMPUTER_USE_2025_01_24 =
        T.let(:"computer-use-2025-01-24", Anthropic::Models::AnthropicBeta::TaggedSymbol)
      PDFS_2024_09_25 = T.let(:"pdfs-2024-09-25", Anthropic::Models::AnthropicBeta::TaggedSymbol)
      TOKEN_COUNTING_2024_11_01 =
        T.let(:"token-counting-2024-11-01", Anthropic::Models::AnthropicBeta::TaggedSymbol)
      TOKEN_EFFICIENT_TOOLS_2025_02_19 =
        T.let(:"token-efficient-tools-2025-02-19", Anthropic::Models::AnthropicBeta::TaggedSymbol)
      OUTPUT_128K_2025_02_19 = T.let(:"output-128k-2025-02-19", Anthropic::Models::AnthropicBeta::TaggedSymbol)

      class << self
        sig { override.returns([String, Anthropic::Models::AnthropicBeta::OrSymbol]) }
        def variants
        end
      end
    end
  end
end
