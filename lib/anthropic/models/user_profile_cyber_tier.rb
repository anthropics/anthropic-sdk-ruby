# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileCyberTier < Anthropic::Internal::Type::BaseModel
      # @!attribute status
      #   `active` when the tier applies to the profile, otherwise `inactive`. The
      #   response does not say why a tier is `inactive`: it can be in review, declined,
      #   withdrawn, never applied for, or approved but not applied to this profile.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileCyberTier::Status]
      required :status, enum: -> { Anthropic::UserProfileCyberTier::Status }

      # @!method initialize(status:)
      #   One tier of the Cyber Verification Program.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileCyberTier} for more details.
      #
      #   @param status [Symbol, Anthropic::Models::UserProfileCyberTier::Status] `active` when the tier applies to the profile, otherwise `inactive`. The respons

      # `active` when the tier applies to the profile, otherwise `inactive`. The
      # response does not say why a tier is `inactive`: it can be in review, declined,
      # withdrawn, never applied for, or approved but not applied to this profile.
      #
      # @see Anthropic::Models::UserProfileCyberTier#status
      module Status
        extend Anthropic::Internal::Type::Enum

        ACTIVE = :active
        INACTIVE = :inactive

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
