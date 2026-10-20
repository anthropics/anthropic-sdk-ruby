# typed: strong

module Anthropic
  module Models
    # A user profile's status in a program. Each program's `status` field says what
    # the values mean there.
    module UserProfileProgramStatus
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::UserProfileProgramStatus) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      # The profile is in the program.
      ACTIVE = T.let(:active, Anthropic::UserProfileProgramStatus::TaggedSymbol)

      # The profile is not in the program yet, and something is still awaited.
      PENDING =
        T.let(:pending, Anthropic::UserProfileProgramStatus::TaggedSymbol)

      # The profile is not in the program and nothing is awaited: Anthropic has declined, or has withdrawn an earlier approval.
      REJECTED =
        T.let(:rejected, Anthropic::UserProfileProgramStatus::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Anthropic::UserProfileProgramStatus::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
