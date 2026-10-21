# typed: strong

module Anthropic
  module Models
    # A limit Anthropic has placed on the entity this profile represents and not yet
    # resolved, discriminated by `type`: `restriction` or `ban`. More types may be
    # added; read a `type` you do not recognize as `restriction`.
    module UserProfileEnforcementAction
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::UserProfileEnforcementActionRestriction,
            Anthropic::UserProfileEnforcementActionBan
          )
        end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::UserProfileEnforcementAction::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RESTRICTION =
          T.let(
            :restriction,
            Anthropic::UserProfileEnforcementAction::Type::TaggedSymbol
          )
        BAN =
          T.let(
            :ban,
            Anthropic::UserProfileEnforcementAction::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::UserProfileEnforcementAction::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      sig do
        override.returns(
          T::Array[Anthropic::UserProfileEnforcementAction::Variants]
        )
      end
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: Anthropic::UserProfileEnforcementAction::Type::OrSymbol,
          id: String,
          action:
            T.nilable(
              Anthropic::UserProfileEnforcementActionNextStep::OrSymbol
            ),
          expires_at: T.nilable(Time),
          opened_at: Time,
          reason: Anthropic::UserProfileEnforcementActionReason::OrSymbol
        ).returns(Anthropic::UserProfileEnforcementAction::Variants)
      end
      def self.new(
        type:,
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
        reason:
      )
      end
    end
  end
end
