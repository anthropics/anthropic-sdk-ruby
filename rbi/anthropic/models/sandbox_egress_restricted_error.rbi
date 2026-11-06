# typed: strong

module Anthropic
  module Models
    # The request came from a Claude sandbox with restricted network access, which is
    # not allowed to make this change. Send it from outside the sandbox, or from a
    # sandbox with unrestricted network access.
    class SandboxEgressRestrictedError < Anthropic::Errors::PermissionDeniedError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::SandboxEgressRestrictedErrorDetails) }
      def details
      end
    end
  end
end
