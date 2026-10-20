# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfileCyberProgram < Anthropic::Internal::Type::BaseModel
      # @!attribute requirements
      #   What a request that names the profile must allow to get the relaxed safeguards
      #   of every `active` tier. `null` when no tier is `active`, and wherever `tiers` is
      #   `{}`.
      #
      #   @return [Anthropic::Models::UserProfileCyberRequirements, nil]
      required :requirements, -> { Anthropic::UserProfileCyberRequirements }, nil?: true

      # @!attribute status
      #   `active` when at least one tier is `active`, or when the profile has the
      #   program's access to earlier models. That access is not a tier: a profile that
      #   has it alone reads `active` with every tier `inactive`, or with `tiers` `{}` on
      #   a response that does not report tiers. When nothing is `active`, `pending` means
      #   that an application or enrollment is under review, or that what Anthropic
      #   approved does not yet apply to this profile, and `rejected` means that the
      #   application or enrollment was declined.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileProgramStatus]
      required :status, enum: -> { Anthropic::UserProfileProgramStatus }

      # @!attribute tiers
      #   The program's tiers, keyed by tier: `a` (Specialized Access), `b` (Red Team
      #   Access) and `c` (Defense Access). A response reports either every tier or none.
      #   When it reports them, as retrieving the profile normally does, every tier has a
      #   key, whether or not it applies to the profile. When it does not, as in the list
      #   of user profiles, `tiers` is `{}`, which does not mean that the tiers are
      #   inactive. No tier implies another, so read the tier you need. Anthropic may add
      #   tiers; ignore a key you do not recognize.
      #
      #   @return [Hash{Symbol=>Anthropic::Models::UserProfileCyberTier}]
      required :tiers, -> { Anthropic::Internal::Type::HashOf[Anthropic::UserProfileCyberTier] }

      # @!method initialize(requirements:, status:, tiers:)
      #   A user profile's standing in the Cyber Verification Program, which relaxes cyber
      #   safeguards for requests that name the profile.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileCyberProgram} for more details.
      #
      #   @param requirements [Anthropic::Models::UserProfileCyberRequirements, nil] What a request that names the profile must allow to get the relaxed safeguards o
      #
      #   @param status [Symbol, Anthropic::Models::UserProfileProgramStatus] `active` when at least one tier is `active`, or when the profile has the program
      #
      #   @param tiers [Hash{Symbol=>Anthropic::Models::UserProfileCyberTier}] The program's tiers, keyed by tier: `a` (Specialized Access), `b` (Red Team Acce
    end
  end
end
