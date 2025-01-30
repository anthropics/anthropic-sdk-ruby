# typed: strong

module Anthropic
  module Models
    class AnthropicBeta < Anthropic::Union
      abstract!

      Variants = T.type_alias { T.any(String, Symbol) }

      class UnionMember1 < Anthropic::Enum
        abstract!

        MESSAGE_BATCHES_2024_09_24 = :"message-batches-2024-09-24"
        PROMPT_CACHING_2024_07_31 = :"prompt-caching-2024-07-31"
        COMPUTER_USE_2024_10_22 = :"computer-use-2024-10-22"
        PDFS_2024_09_25 = :"pdfs-2024-09-25"
        TOKEN_COUNTING_2024_11_01 = :"token-counting-2024-11-01"

        sig { override.returns(T::Array[Symbol]) }
        def self.values; end
      end

      sig { override.returns([[NilClass, String], [NilClass, Symbol]]) }
      private_class_method def self.variants; end
    end
  end
end
