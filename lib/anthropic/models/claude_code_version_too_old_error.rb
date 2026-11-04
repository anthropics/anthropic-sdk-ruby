# frozen_string_literal: true

module Anthropic
  module Models
    # The request comes from a Claude Code version older than the minimum that the
    # requested model or the organization requires. Update Claude Code, then retry.
    class ClaudeCodeVersionTooOldError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :claude_code_version_too_old]

      # @return [Anthropic::Models::ClaudeCodeVersionTooOldErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ClaudeCodeVersionTooOldErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
