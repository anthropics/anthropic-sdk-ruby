# typed: strong

module Anthropic
  module Models
    # Sort field for listing user profiles: `created_at` (default) or `name`
    # (case-insensitive; profiles without a name sort last).
    module UserProfileListOrderBy
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::UserProfileListOrderBy) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      # Sort by when each user profile was created. This is the default.
      CREATED_AT =
        T.let(:created_at, Anthropic::UserProfileListOrderBy::TaggedSymbol)

      # Sort by `name`, ignoring the case of ASCII letters. Profiles without a name come last in either direction.
      NAME = T.let(:name, Anthropic::UserProfileListOrderBy::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Anthropic::UserProfileListOrderBy::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
