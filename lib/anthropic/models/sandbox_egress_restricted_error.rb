# frozen_string_literal: true

module Anthropic
  module Models
    # The request came from a Claude sandbox with restricted network access, which is
    # not allowed to make this change. Send it from outside the sandbox, or from a
    # sandbox with unrestricted network access.
    class SandboxEgressRestrictedError < Anthropic::Errors::PermissionDeniedError
      # @!method error_code
      #   @return [Symbol, :sandbox_egress_restricted]

      # @return [Anthropic::Models::SandboxEgressRestrictedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::SandboxEgressRestrictedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
