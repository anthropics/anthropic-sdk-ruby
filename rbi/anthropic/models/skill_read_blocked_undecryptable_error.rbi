# typed: strong

module Anthropic
  module Models
    # A custom skill the request names is stored under an encryption key state the
    # workspace cannot currently decrypt.
    class SkillReadBlockedUndecryptableError < Anthropic::Errors::ConflictError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::SkillReadBlockedUndecryptableErrorDetails) }
      def details
      end
    end
  end
end
