# frozen_string_literal: true

module Anthropic
  module Models
    module AnthropicBeta
      extend Anthropic::Union

      # @!group

      MESSAGE_BATCHES_2024_09_24 = :"message-batches-2024-09-24"
      PROMPT_CACHING_2024_07_31 = :"prompt-caching-2024-07-31"
      COMPUTER_USE_2024_10_22 = :"computer-use-2024-10-22"
      COMPUTER_USE_2025_01_24 = :"computer-use-2025-01-24"
      PDFS_2024_09_25 = :"pdfs-2024-09-25"
      TOKEN_COUNTING_2024_11_01 = :"token-counting-2024-11-01"
      TOKEN_EFFICIENT_TOOLS_2025_02_19 = :"token-efficient-tools-2025-02-19"
      OUTPUT_128K_2025_02_19 = :"output-128k-2025-02-19"

      # @!endgroup

      variant String

      variant const: Anthropic::Models::AnthropicBeta::MESSAGE_BATCHES_2024_09_24

      variant const: Anthropic::Models::AnthropicBeta::PROMPT_CACHING_2024_07_31

      variant const: Anthropic::Models::AnthropicBeta::COMPUTER_USE_2024_10_22

      variant const: Anthropic::Models::AnthropicBeta::COMPUTER_USE_2025_01_24

      variant const: Anthropic::Models::AnthropicBeta::PDFS_2024_09_25

      variant const: Anthropic::Models::AnthropicBeta::TOKEN_COUNTING_2024_11_01

      variant const: Anthropic::Models::AnthropicBeta::TOKEN_EFFICIENT_TOOLS_2025_02_19

      variant const: Anthropic::Models::AnthropicBeta::OUTPUT_128K_2025_02_19

      # @!parse
      #   # @return [Array(String, Symbol)]
      #   def self.variants; end
    end
  end
end
