# frozen_string_literal: true

module Anthropic
  module Models
    class SandboxEgressRestrictedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :sandbox_egress_restricted]
      required :error_code, const: :sandbox_egress_restricted

      # @!method initialize(error_code: :sandbox_egress_restricted)
      #   The request came from a Claude sandbox with restricted network access, which is
      #   not allowed to make this change. Send it from outside the sandbox, or from a
      #   sandbox with unrestricted network access.
      #
      #   @param error_code [Symbol, :sandbox_egress_restricted]
    end
  end
end
