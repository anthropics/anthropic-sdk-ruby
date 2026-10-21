# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileEnforcementActionRestriction < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #   The action's ID (`enac_...`), stable while the action is open.
      #
      #   @return [String]
      required :id, String

      # @!attribute action
      #   The next step on the action: `verify` or `null`. `verify`: the end user can
      #   clear it now by passing an identity check. `null`: there is nothing the end user
      #   can do now to clear it, including while Anthropic reviews an identity check the
      #   end user submitted.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileEnforcementActionNextStep, nil]
      required :action, enum: -> { Anthropic::UserProfileEnforcementActionNextStep }, nil?: true

      # @!attribute expires_at
      #   When the action ends on its own, in RFC 3339 format; it stops showing once this
      #   time has passed. `null` when it has no end date, and always `null` when `reason`
      #   is `account_compromise`.
      #
      #   @return [Time, nil]
      required :expires_at, Time, nil?: true

      # @!attribute opened_at
      #   When Anthropic opened the action, in RFC 3339 format.
      #
      #   @return [Time]
      required :opened_at, Time

      # @!attribute reason
      #   Why Anthropic placed the limit: `unsupported_region`, `fraud_or_abuse`,
      #   `high_harm`, `usage_policy_violation`, `account_compromise` or `unspecified`.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileEnforcementActionReason]
      required :reason, enum: -> { Anthropic::UserProfileEnforcementActionReason }

      # @!attribute type
      #
      #   @return [Symbol, :restriction]
      required :type, const: :restriction

      # @!method initialize(id:, action:, expires_at:, opened_at:, reason:, type: :restriction)
      #   Anthropic has limited how it serves the end user until the action is resolved.
      #   The end user may still be served in part.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileEnforcementActionRestriction} for more details.
      #
      #   @param id [String] The action's ID (`enac_...`), stable while the action is open.
      #
      #   @param action [Symbol, Anthropic::Models::UserProfileEnforcementActionNextStep, nil] The next step on the action: `verify` or `null`. `verify`: the end user can clea
      #
      #   @param expires_at [Time, nil] When the action ends on its own, in RFC 3339 format; it stops showing once this
      #
      #   @param opened_at [Time] When Anthropic opened the action, in RFC 3339 format.
      #
      #   @param reason [Symbol, Anthropic::Models::UserProfileEnforcementActionReason] Why Anthropic placed the limit: `unsupported_region`, `fraud_or_abuse`, `high_ha
      #
      #   @param type [Symbol, :restriction]
    end
  end
end
