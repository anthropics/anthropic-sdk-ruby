# typed: strong

module Anthropic
  module Models
    # Why Anthropic placed this enforcement action: `unsupported_region`,
    # `fraud_or_abuse`, `high_harm`, `usage_policy_violation`, `account_compromise` or
    # `unspecified`. More values may be added; read a value you do not recognize as
    # `unspecified`.
    module UserProfileEnforcementActionReason
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias do
          T.all(Symbol, Anthropic::UserProfileEnforcementActionReason)
        end
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      UNSUPPORTED_REGION =
        T.let(
          :unsupported_region,
          Anthropic::UserProfileEnforcementActionReason::TaggedSymbol
        )
      FRAUD_OR_ABUSE =
        T.let(
          :fraud_or_abuse,
          Anthropic::UserProfileEnforcementActionReason::TaggedSymbol
        )
      HIGH_HARM =
        T.let(
          :high_harm,
          Anthropic::UserProfileEnforcementActionReason::TaggedSymbol
        )
      USAGE_POLICY_VIOLATION =
        T.let(
          :usage_policy_violation,
          Anthropic::UserProfileEnforcementActionReason::TaggedSymbol
        )
      ACCOUNT_COMPROMISE =
        T.let(
          :account_compromise,
          Anthropic::UserProfileEnforcementActionReason::TaggedSymbol
        )
      UNSPECIFIED =
        T.let(
          :unspecified,
          Anthropic::UserProfileEnforcementActionReason::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[Anthropic::UserProfileEnforcementActionReason::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
