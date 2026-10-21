# typed: strong

module Anthropic
  module Models
    class UserProfileEnforcementActionRestriction < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileEnforcementActionRestriction,
            Anthropic::Internal::AnyHash
          )
        end

      # The action's ID (`enac_...`), stable while the action is open.
      sig { returns(String) }
      attr_accessor :id

      # The next step on the action: `verify` or `null`. `verify`: the end user can
      # clear it now by passing an identity check. `null`: there is nothing the end user
      # can do now to clear it, including while Anthropic reviews an identity check the
      # end user submitted.
      sig do
        returns(
          T.nilable(
            Anthropic::UserProfileEnforcementActionNextStep::TaggedSymbol
          )
        )
      end
      attr_accessor :action

      # When the action ends on its own, in RFC 3339 format; it stops showing once this
      # time has passed. `null` when it has no end date, and always `null` when `reason`
      # is `account_compromise`.
      sig { returns(T.nilable(Time)) }
      attr_accessor :expires_at

      # When Anthropic opened the action, in RFC 3339 format.
      sig { returns(Time) }
      attr_accessor :opened_at

      # Why Anthropic placed the limit: `unsupported_region`, `fraud_or_abuse`,
      # `high_harm`, `usage_policy_violation`, `account_compromise` or `unspecified`.
      sig do
        returns(Anthropic::UserProfileEnforcementActionReason::TaggedSymbol)
      end
      attr_accessor :reason

      sig { returns(Symbol) }
      attr_accessor :type

      # Anthropic has limited how it serves the end user until the action is resolved.
      # The end user may still be served in part.
      sig do
        params(
          id: String,
          action:
            T.nilable(
              Anthropic::UserProfileEnforcementActionNextStep::OrSymbol
            ),
          expires_at: T.nilable(Time),
          opened_at: Time,
          reason: Anthropic::UserProfileEnforcementActionReason::OrSymbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The action's ID (`enac_...`), stable while the action is open.
        id:,
        # The next step on the action: `verify` or `null`. `verify`: the end user can
        # clear it now by passing an identity check. `null`: there is nothing the end user
        # can do now to clear it, including while Anthropic reviews an identity check the
        # end user submitted.
        action:,
        # When the action ends on its own, in RFC 3339 format; it stops showing once this
        # time has passed. `null` when it has no end date, and always `null` when `reason`
        # is `account_compromise`.
        expires_at:,
        # When Anthropic opened the action, in RFC 3339 format.
        opened_at:,
        # Why Anthropic placed the limit: `unsupported_region`, `fraud_or_abuse`,
        # `high_harm`, `usage_policy_violation`, `account_compromise` or `unspecified`.
        reason:,
        type: :restriction
      )
      end

      sig do
        override.returns(
          {
            id: String,
            action:
              T.nilable(
                Anthropic::UserProfileEnforcementActionNextStep::TaggedSymbol
              ),
            expires_at: T.nilable(Time),
            opened_at: Time,
            reason: Anthropic::UserProfileEnforcementActionReason::TaggedSymbol,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
