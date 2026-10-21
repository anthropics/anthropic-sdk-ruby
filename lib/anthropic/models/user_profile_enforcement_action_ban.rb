# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileEnforcementActionBan < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #   The action's ID (`enac_...`), stable while the action is open.
      #
      #   @return [String]
      required :id, String

      # @!attribute action
      #   Always `null`: the end user cannot clear a ban.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileEnforcementActionNextStep, nil]
      required :action, enum: -> { Anthropic::UserProfileEnforcementActionNextStep }, nil?: true

      # @!attribute expires_at
      #   Always `null`: a ban has no end date.
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
      #   @return [Symbol, :ban]
      required :type, const: :ban

      # @!method initialize(id:, action:, expires_at:, opened_at:, reason:, type: :ban)
      #   Anthropic has stopped serving the end user where the ban applies and does not
      #   plan to serve them there again.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileEnforcementActionBan} for more details.
      #
      #   @param id [String] The action's ID (`enac_...`), stable while the action is open.
      #
      #   @param action [Symbol, Anthropic::Models::UserProfileEnforcementActionNextStep, nil] Always `null`: the end user cannot clear a ban.
      #
      #   @param expires_at [Time, nil] Always `null`: a ban has no end date.
      #
      #   @param opened_at [Time] When Anthropic opened the action, in RFC 3339 format.
      #
      #   @param reason [Symbol, Anthropic::Models::UserProfileEnforcementActionReason] Why Anthropic placed the limit: `unsupported_region`, `fraud_or_abuse`, `high_ha
      #
      #   @param type [Symbol, :ban]
    end
  end
end
