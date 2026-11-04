# typed: strong

module Anthropic
  module Models
    # The request comes from a Claude Code version older than the minimum that the
    # requested model or the organization requires. Update Claude Code, then retry.
    class ClaudeCodeVersionTooOldError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ClaudeCodeVersionTooOldErrorDetails) }
      def details
      end
    end
  end
end
