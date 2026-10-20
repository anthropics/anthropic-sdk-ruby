# typed: strong

module Anthropic
  module Models
    class UserProfileCyberProgram < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::UserProfileCyberProgram,
            Anthropic::Internal::AnyHash
          )
        end

      # What a request that names the profile must allow to get the relaxed safeguards
      # of every `active` tier. `null` when no tier is `active`, and wherever `tiers` is
      # `{}`.
      sig { returns(T.nilable(Anthropic::UserProfileCyberRequirements)) }
      attr_reader :requirements

      sig do
        params(
          requirements:
            T.nilable(Anthropic::UserProfileCyberRequirements::OrHash)
        ).void
      end
      attr_writer :requirements

      # `active` when at least one tier is `active`, or when the profile has the
      # program's access to earlier models. That access is not a tier: a profile that
      # has it alone reads `active` with every tier `inactive`, or with `tiers` `{}` on
      # a response that does not report tiers. When nothing is `active`, `pending` means
      # that an application or enrollment is under review, or that what Anthropic
      # approved does not yet apply to this profile, and `rejected` means that the
      # application or enrollment was declined.
      sig { returns(Anthropic::UserProfileProgramStatus::TaggedSymbol) }
      attr_accessor :status

      # The program's tiers, keyed by tier: `a` (Specialized Access), `b` (Red Team
      # Access) and `c` (Defense Access). A response reports either every tier or none.
      # When it reports them, as retrieving the profile normally does, every tier has a
      # key, whether or not it applies to the profile. When it does not, as in the list
      # of user profiles, `tiers` is `{}`, which does not mean that the tiers are
      # inactive. No tier implies another, so read the tier you need. Anthropic may add
      # tiers; ignore a key you do not recognize.
      sig { returns(T::Hash[Symbol, Anthropic::UserProfileCyberTier]) }
      attr_accessor :tiers

      # A user profile's standing in the Cyber Verification Program, which relaxes cyber
      # safeguards for requests that name the profile.
      sig do
        params(
          requirements:
            T.nilable(Anthropic::UserProfileCyberRequirements::OrHash),
          status: Anthropic::UserProfileProgramStatus::OrSymbol,
          tiers: T::Hash[Symbol, Anthropic::UserProfileCyberTier::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # What a request that names the profile must allow to get the relaxed safeguards
        # of every `active` tier. `null` when no tier is `active`, and wherever `tiers` is
        # `{}`.
        requirements:,
        # `active` when at least one tier is `active`, or when the profile has the
        # program's access to earlier models. That access is not a tier: a profile that
        # has it alone reads `active` with every tier `inactive`, or with `tiers` `{}` on
        # a response that does not report tiers. When nothing is `active`, `pending` means
        # that an application or enrollment is under review, or that what Anthropic
        # approved does not yet apply to this profile, and `rejected` means that the
        # application or enrollment was declined.
        status:,
        # The program's tiers, keyed by tier: `a` (Specialized Access), `b` (Red Team
        # Access) and `c` (Defense Access). A response reports either every tier or none.
        # When it reports them, as retrieving the profile normally does, every tier has a
        # key, whether or not it applies to the profile. When it does not, as in the list
        # of user profiles, `tiers` is `{}`, which does not mean that the tiers are
        # inactive. No tier implies another, so read the tier you need. Anthropic may add
        # tiers; ignore a key you do not recognize.
        tiers:
      )
      end

      sig do
        override.returns(
          {
            requirements: T.nilable(Anthropic::UserProfileCyberRequirements),
            status: Anthropic::UserProfileProgramStatus::TaggedSymbol,
            tiers: T::Hash[Symbol, Anthropic::UserProfileCyberTier]
          }
        )
      end
      def to_hash
      end
    end
  end
end
