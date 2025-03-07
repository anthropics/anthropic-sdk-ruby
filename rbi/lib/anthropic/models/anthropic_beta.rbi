# typed: strong

module Anthropic
  module Models
    class AnthropicBeta < Anthropic::Union
      abstract!

      class UnionMember1 < Anthropic::Enum
        abstract!

        MESSAGE_BATCHES_2024_09_24 = :"message-batches-2024-09-24"
        PROMPT_CACHING_2024_07_31 = :"prompt-caching-2024-07-31"
        COMPUTER_USE_2024_10_22 = :"computer-use-2024-10-22"
        COMPUTER_USE_2025_01_24 = :"computer-use-2025-01-24"
        PDFS_2024_09_25 = :"pdfs-2024-09-25"
        TOKEN_COUNTING_2024_11_01 = :"token-counting-2024-11-01"
        TOKEN_EFFICIENT_TOOLS_2025_02_19 = :"token-efficient-tools-2025-02-19"
        OUTPUT_128K_2025_02_19 = :"output-128k-2025-02-19"

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end

      class << self
        sig { override.returns([[NilClass, String], [NilClass, Symbol]]) }
        private def variants
        end
      end
    end
  end
end
