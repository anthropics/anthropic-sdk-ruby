# frozen_string_literal: true

module Anthropic
  module Models
    # Why Anthropic placed this enforcement action: `unsupported_region`,
    # `fraud_or_abuse`, `high_harm`, `usage_policy_violation`, `account_compromise` or
    # `unspecified`. More values may be added; read a value you do not recognize as
    # `unspecified`.
    module UserProfileEnforcementActionReason
      extend Anthropic::Internal::Type::Enum

      UNSUPPORTED_REGION = :unsupported_region
      FRAUD_OR_ABUSE = :fraud_or_abuse
      HIGH_HARM = :high_harm
      USAGE_POLICY_VIOLATION = :usage_policy_violation
      ACCOUNT_COMPROMISE = :account_compromise
      UNSPECIFIED = :unspecified

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
