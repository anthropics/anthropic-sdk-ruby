# frozen_string_literal: true

module Anthropic
  module Models
    class CompactionSignatureInvalidErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :compaction_signature_invalid]
      required :error_code, const: :compaction_signature_invalid

      # @!method initialize(error_code: :compaction_signature_invalid)
      #   The `compaction` block's `signature` does not verify.
      #
      #   @param error_code [Symbol, :compaction_signature_invalid]
    end
  end
end
