# typed: strong

module Anthropic
  module Models
    class UserProfileEnforcementActionBan < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileEnforcementActionBan,
            Anthropic::Internal::AnyHash
          )
        end

      # The action's ID (`enac_...`), stable while the action is open.
      sig { returns(String) }
      attr_accessor :id

      # Always `null`: the end user cannot clear a ban.
      sig do
        returns(
          T.nilable(
            Anthropic::UserProfileEnforcementActionNextStep::TaggedSymbol
          )
        )
      end
      attr_accessor :action

      # Always `null`: a ban has no end date.
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

      # Anthropic has stopped serving the end user where the ban applies and does not
      # plan to serve them there again.
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
        # Always `null`: the end user cannot clear a ban.
        action:,
        # Always `null`: a ban has no end date.
        expires_at:,
        # When Anthropic opened the action, in RFC 3339 format.
        opened_at:,
        # Why Anthropic placed the limit: `unsupported_region`, `fraud_or_abuse`,
        # `high_harm`, `usage_policy_violation`, `account_compromise` or `unspecified`.
        reason:,
        type: :ban
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
