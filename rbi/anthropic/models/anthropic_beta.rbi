# typed: strong

module Anthropic
  module Models
    module AnthropicBeta
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias { T.any(String, Anthropic::AnthropicBeta::TaggedSymbol) }

      sig { override.returns(T::Array[Anthropic::AnthropicBeta::Variants]) }
      def self.variants
      end

      TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::AnthropicBeta) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      MESSAGE_BATCHES_2024_09_24 =
        T.let(
          :"message-batches-2024-09-24",
          Anthropic::AnthropicBeta::TaggedSymbol
        )
      PROMPT_CACHING_2024_07_31 =
        T.let(
          :"prompt-caching-2024-07-31",
          Anthropic::AnthropicBeta::TaggedSymbol
        )
      COMPUTER_USE_2024_10_22 =
        T.let(
          :"computer-use-2024-10-22",
          Anthropic::AnthropicBeta::TaggedSymbol
        )
      COMPUTER_USE_2025_01_24 =
        T.let(
          :"computer-use-2025-01-24",
          Anthropic::AnthropicBeta::TaggedSymbol
        )
      PDFS_2024_09_25 =
        T.let(:"pdfs-2024-09-25", Anthropic::AnthropicBeta::TaggedSymbol)
      TOKEN_COUNTING_2024_11_01 =
        T.let(
          :"token-counting-2024-11-01",
          Anthropic::AnthropicBeta::TaggedSymbol
        )
      TOKEN_EFFICIENT_TOOLS_2025_02_19 =
        T.let(
          :"token-efficient-tools-2025-02-19",
          Anthropic::AnthropicBeta::TaggedSymbol
        )
      OUTPUT_128K_2025_02_19 =
        T.let(:"output-128k-2025-02-19", Anthropic::AnthropicBeta::TaggedSymbol)
      FILES_API_2025_04_14 =
        T.let(:"files-api-2025-04-14", Anthropic::AnthropicBeta::TaggedSymbol)
      MCP_CLIENT_2025_04_04 =
        T.let(:"mcp-client-2025-04-04", Anthropic::AnthropicBeta::TaggedSymbol)
      DEV_FULL_THINKING_2025_05_14 =
        T.let(
          :"dev-full-thinking-2025-05-14",
          Anthropic::AnthropicBeta::TaggedSymbol
        )
      INTERLEAVED_THINKING_2025_05_14 =
        T.let(
          :"interleaved-thinking-2025-05-14",
          Anthropic::AnthropicBeta::TaggedSymbol
        )
      CODE_EXECUTION_2025_05_22 =
        T.let(
          :"code-execution-2025-05-22",
          Anthropic::AnthropicBeta::TaggedSymbol
        )
      EXTENDED_CACHE_TTL_2025_04_11 =
        T.let(
          :"extended-cache-ttl-2025-04-11",
          Anthropic::AnthropicBeta::TaggedSymbol
        )
    end
  end
end
