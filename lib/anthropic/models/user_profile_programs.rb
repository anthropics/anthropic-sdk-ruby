# frozen_string_literal: true

module Anthropic
  module Models
    class UserProfilePrograms < Anthropic::Internal::Type::BaseModel
      # @!attribute cyber
      #   The profile's standing in the Cyber Verification Program. `null` when the
      #   profile has no status in it. Only retrieving the profile gives the full answer:
      #   a list or update response can show `null`, or a status other than `active`, for
      #   a profile that reads `active` when retrieved.
      #
      #   @return [Anthropic::Models::UserProfileCyberProgram, nil]
      required :cyber, -> { Anthropic::UserProfileCyberProgram }, nil?: true

      # @!attribute efs
      #   The profile's standing in Enterprise Frontier Safeguards. `null` unless the
      #   platform's attestation for the program is in place on this profile, or the
      #   entity it represents has applied to the program. A list of user profiles does
      #   not report this program: there it reads `null` for every profile, so retrieve
      #   the profile to read it.
      #
      #   @return [Anthropic::Models::UserProfileEfsProgram, nil]
      required :efs, -> { Anthropic::UserProfileEfsProgram }, nil?: true

      # @!method initialize(cyber:, efs:)
      #   A user profile's standing in each program. A program is a set of capabilities or
      #   exemptions that Anthropic approves for the entity the profile represents. A
      #   program reads `null` when the profile has no status in it, when the caller's
      #   organization is not entitled to read programs, or when the response does not
      #   report that program. Retrieving the profile reports every program. Anthropic may
      #   add programs; ignore a key you do not recognize.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfilePrograms} for more details.
      #
      #   @param cyber [Anthropic::Models::UserProfileCyberProgram, nil] The profile's standing in the Cyber Verification Program. `null` when the profil
      #
      #   @param efs [Anthropic::Models::UserProfileEfsProgram, nil] The profile's standing in Enterprise Frontier Safeguards. `null` unless the plat
    end
  end
end
