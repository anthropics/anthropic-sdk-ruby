# typed: strong

module Anthropic
  module Models
    class ClaudeCodeVersionTooOldErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ClaudeCodeVersionTooOldErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request comes from a Claude Code version older than the minimum that the
      # requested model or the organization requires. Update Claude Code, then retry.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :claude_code_version_too_old)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
