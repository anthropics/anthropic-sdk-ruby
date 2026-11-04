# frozen_string_literal: true

module Anthropic
  module Models
    # The `compaction` block's `signature` does not verify.
    class CompactionSignatureInvalidError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :compaction_signature_invalid]

      # @return [Anthropic::Models::CompactionSignatureInvalidErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CompactionSignatureInvalidErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
