# frozen_string_literal: true

module Anthropic
  module Models
    class ClaudeCodeVersionTooOldErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :claude_code_version_too_old]
      required :error_code, const: :claude_code_version_too_old

      # @!method initialize(error_code: :claude_code_version_too_old)
      #   The request comes from a Claude Code version older than the minimum that the
      #   requested model or the organization requires. Update Claude Code, then retry.
      #
      #   @param error_code [Symbol, :claude_code_version_too_old]
    end
  end
end
