# typed: strong

module Anthropic
  module Models
    class UserProfilePrograms < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::UserProfilePrograms, Anthropic::Internal::AnyHash)
        end

      # The profile's standing in the Cyber Verification Program. `null` when the
      # profile has no status in it. Only retrieving the profile gives the full answer:
      # a list or update response can show `null`, or a status other than `active`, for
      # a profile that reads `active` when retrieved.
      sig { returns(T.nilable(Anthropic::UserProfileCyberProgram)) }
      attr_reader :cyber

      sig do
        params(
          cyber: T.nilable(Anthropic::UserProfileCyberProgram::OrHash)
        ).void
      end
      attr_writer :cyber

      # The profile's standing in Enterprise Frontier Safeguards. `null` unless the
      # platform's attestation for the program is in place on this profile, or the
      # entity it represents has applied to the program. A list of user profiles does
      # not report this program: there it reads `null` for every profile, so retrieve
      # the profile to read it.
      sig { returns(T.nilable(Anthropic::UserProfileEfsProgram)) }
      attr_reader :efs

      sig do
        params(efs: T.nilable(Anthropic::UserProfileEfsProgram::OrHash)).void
      end
      attr_writer :efs

      # A user profile's standing in each program. A program is a set of capabilities or
      # exemptions that Anthropic approves for the entity the profile represents. A
      # program reads `null` when the profile has no status in it, when the caller's
      # organization is not entitled to read programs, or when the response does not
      # report that program. Retrieving the profile reports every program. Anthropic may
      # add programs; ignore a key you do not recognize.
      sig do
        params(
          cyber: T.nilable(Anthropic::UserProfileCyberProgram::OrHash),
          efs: T.nilable(Anthropic::UserProfileEfsProgram::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # The profile's standing in the Cyber Verification Program. `null` when the
        # profile has no status in it. Only retrieving the profile gives the full answer:
        # a list or update response can show `null`, or a status other than `active`, for
        # a profile that reads `active` when retrieved.
        cyber:,
        # The profile's standing in Enterprise Frontier Safeguards. `null` unless the
        # platform's attestation for the program is in place on this profile, or the
        # entity it represents has applied to the program. A list of user profiles does
        # not report this program: there it reads `null` for every profile, so retrieve
        # the profile to read it.
        efs:
      )
      end

      sig do
        override.returns(
          {
            cyber: T.nilable(Anthropic::UserProfileCyberProgram),
            efs: T.nilable(Anthropic::UserProfileEfsProgram)
          }
        )
      end
      def to_hash
      end
    end
  end
end
