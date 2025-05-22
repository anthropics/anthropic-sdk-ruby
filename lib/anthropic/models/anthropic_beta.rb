# frozen_string_literal: true

module Anthropic
  module Models
    module AnthropicBeta
      extend Anthropic::Internal::Type::Union

      variant String

      variant const: -> { Anthropic::Models::AnthropicBeta::MESSAGE_BATCHES_2024_09_24 }

      variant const: -> { Anthropic::Models::AnthropicBeta::PROMPT_CACHING_2024_07_31 }

      variant const: -> { Anthropic::Models::AnthropicBeta::COMPUTER_USE_2024_10_22 }

      variant const: -> { Anthropic::Models::AnthropicBeta::COMPUTER_USE_2025_01_24 }

      variant const: -> { Anthropic::Models::AnthropicBeta::PDFS_2024_09_25 }

      variant const: -> { Anthropic::Models::AnthropicBeta::TOKEN_COUNTING_2024_11_01 }

      variant const: -> { Anthropic::Models::AnthropicBeta::TOKEN_EFFICIENT_TOOLS_2025_02_19 }

      variant const: -> { Anthropic::Models::AnthropicBeta::OUTPUT_128K_2025_02_19 }

      variant const: -> { Anthropic::Models::AnthropicBeta::FILES_API_2025_04_14 }

      variant const: -> { Anthropic::Models::AnthropicBeta::MCP_CLIENT_2025_04_04 }

      variant const: -> { Anthropic::Models::AnthropicBeta::DEV_FULL_THINKING_2025_05_14 }

      variant const: -> { Anthropic::Models::AnthropicBeta::INTERLEAVED_THINKING_2025_05_14 }

      variant const: -> { Anthropic::Models::AnthropicBeta::CODE_EXECUTION_2025_05_22 }

      variant const: -> { Anthropic::Models::AnthropicBeta::EXTENDED_CACHE_TTL_2025_04_11 }

      # @!method self.variants
      #   @return [Array(String, Symbol)]

      define_sorbet_constant!(:Variants) do
        T.type_alias { T.any(String, Anthropic::AnthropicBeta::TaggedSymbol) }
      end

      # @!group

      MESSAGE_BATCHES_2024_09_24 = :"message-batches-2024-09-24"
      PROMPT_CACHING_2024_07_31 = :"prompt-caching-2024-07-31"
      COMPUTER_USE_2024_10_22 = :"computer-use-2024-10-22"
      COMPUTER_USE_2025_01_24 = :"computer-use-2025-01-24"
      PDFS_2024_09_25 = :"pdfs-2024-09-25"
      TOKEN_COUNTING_2024_11_01 = :"token-counting-2024-11-01"
      TOKEN_EFFICIENT_TOOLS_2025_02_19 = :"token-efficient-tools-2025-02-19"
      OUTPUT_128K_2025_02_19 = :"output-128k-2025-02-19"
      FILES_API_2025_04_14 = :"files-api-2025-04-14"
      MCP_CLIENT_2025_04_04 = :"mcp-client-2025-04-04"
      DEV_FULL_THINKING_2025_05_14 = :"dev-full-thinking-2025-05-14"
      INTERLEAVED_THINKING_2025_05_14 = :"interleaved-thinking-2025-05-14"
      CODE_EXECUTION_2025_05_22 = :"code-execution-2025-05-22"
      EXTENDED_CACHE_TTL_2025_04_11 = :"extended-cache-ttl-2025-04-11"

      # @!endgroup
    end
  end
end
