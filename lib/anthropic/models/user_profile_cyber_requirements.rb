# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileCyberRequirements < Anthropic::Internal::Type::BaseModel
      # @!attribute data_retention
      #   Whether Anthropic must be able to retain the request's inference data.
      #
      #   @return [Boolean]
      required :data_retention, Anthropic::Internal::Type::Boolean

      # @!attribute human_review
      #   Whether Anthropic personnel must be allowed to review the data retained from the
      #   request.
      #
      #   @return [Boolean]
      required :human_review, Anthropic::Internal::Type::Boolean

      # @!method initialize(data_retention:, human_review:)
      #   What a request that names the profile must allow to get the relaxed safeguards
      #   of the profile's `active` tiers. A field reads `true` when at least one of those
      #   tiers has the requirement and Anthropic has not waived it on that tier for the
      #   profile. A request that does not meet a requirement is still served, without the
      #   relaxed safeguards of the tiers that have it. The values differ between profiles
      #   and can change, so read them rather than assuming them.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileCyberRequirements} for more details.
      #
      #   @param data_retention [Boolean] Whether Anthropic must be able to retain the request's inference data.
      #
      #   @param human_review [Boolean] Whether Anthropic personnel must be allowed to review the data retained from the
    end
  end
end
