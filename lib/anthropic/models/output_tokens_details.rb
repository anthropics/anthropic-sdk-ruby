# frozen_string_literal: true

module Anthropic
  module Models
    class OutputTokensDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute thinking_tokens
      #   Number of output tokens the model generated as internal reasoning, including the
      #   thinking-block delimiter tokens.
      #
      #   Reflects the raw reasoning the model produced, not the (possibly shorter)
      #   summarized thinking text returned in the response body. Computed by
      #   re-tokenizing the raw reasoning text, so it may differ from the model's exact
      #   generation count by a small number of tokens. Always ≤ `output_tokens`;
      #   `output_tokens - thinking_tokens` approximates the non-reasoning output.
      #
      #   @return [Integer]
      required :thinking_tokens, Integer

      # @!method initialize(thinking_tokens:)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::OutputTokensDetails} for more details.
      #
      #   @param thinking_tokens [Integer] Number of output tokens the model generated as internal reasoning, including
    end
  end
end
