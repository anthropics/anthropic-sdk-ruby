# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # case union
    # in String
    #   # ...
    # in Anthropic::Models::AnthropicBeta::UnionMember1
    #   # ...
    # end
    # ```
    class AnthropicBeta < Anthropic::Union
      variant String

      variant enum: -> { Anthropic::Models::AnthropicBeta::UnionMember1 }

      # @example
      #
      # ```ruby
      # case enum
      # in :"message-batches-2024-09-24"
      #   # ...
      # in :"prompt-caching-2024-07-31"
      #   # ...
      # in :"computer-use-2024-10-22"
      #   # ...
      # in :"pdfs-2024-09-25"
      #   # ...
      # in :"token-counting-2024-11-01"
      #   # ...
      # end
      # ```
      class UnionMember1 < Anthropic::Enum
        MESSAGE_BATCHES_2024_09_24 = :"message-batches-2024-09-24"
        PROMPT_CACHING_2024_07_31 = :"prompt-caching-2024-07-31"
        COMPUTER_USE_2024_10_22 = :"computer-use-2024-10-22"
        PDFS_2024_09_25 = :"pdfs-2024-09-25"
        TOKEN_COUNTING_2024_11_01 = :"token-counting-2024-11-01"

        finalize!
      end
    end
  end
end
