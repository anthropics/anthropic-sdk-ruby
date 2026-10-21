# typed: strong

module Anthropic
  module Models
    # Anthropic's enforcement status of this profile: `unrestricted`, `pending`,
    # `restricted` or `banned`. More values may be added; read a value you do not
    # recognize as `restricted`.
    module UserProfileEnforcementStatus
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::UserProfileEnforcementStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      UNRESTRICTED =
        T.let(
          :unrestricted,
          Anthropic::UserProfileEnforcementStatus::TaggedSymbol
        )
      PENDING =
        T.let(:pending, Anthropic::UserProfileEnforcementStatus::TaggedSymbol)
      RESTRICTED =
        T.let(
          :restricted,
          Anthropic::UserProfileEnforcementStatus::TaggedSymbol
        )
      BANNED =
        T.let(:banned, Anthropic::UserProfileEnforcementStatus::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Anthropic::UserProfileEnforcementStatus::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
