# typed: strong

module Anthropic
  module Models
    class OutputTokensDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::OutputTokensDetails, Anthropic::Internal::AnyHash)
        end

      # Number of output tokens the model generated as internal reasoning, including the
      # thinking-block delimiter tokens.
      #
      # Reflects the raw reasoning the model produced, not the (possibly shorter)
      # summarized thinking text returned in the response body. Computed by
      # re-tokenizing the raw reasoning text, so it may differ from the model's exact
      # generation count by a small number of tokens. Always ≤ `output_tokens`;
      # `output_tokens - thinking_tokens` approximates the non-reasoning output.
      sig { returns(Integer) }
      attr_accessor :thinking_tokens

      sig { params(thinking_tokens: Integer).returns(T.attached_class) }
      def self.new(
        # Number of output tokens the model generated as internal reasoning, including the
        # thinking-block delimiter tokens.
        #
        # Reflects the raw reasoning the model produced, not the (possibly shorter)
        # summarized thinking text returned in the response body. Computed by
        # re-tokenizing the raw reasoning text, so it may differ from the model's exact
        # generation count by a small number of tokens. Always ≤ `output_tokens`;
        # `output_tokens - thinking_tokens` approximates the non-reasoning output.
        thinking_tokens:
      )
      end

      sig { override.returns({ thinking_tokens: Integer }) }
      def to_hash
      end
    end
  end
end
