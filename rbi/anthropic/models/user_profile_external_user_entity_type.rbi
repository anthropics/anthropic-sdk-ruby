# typed: strong

module Anthropic
  module Models
    # What kind of entity the profile represents, as the platform states it:
    # `individual`, `business`, `non_profit` or `government`.
    module UserProfileExternalUserEntityType
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias do
          T.all(Symbol, Anthropic::UserProfileExternalUserEntityType)
        end
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      INDIVIDUAL =
        T.let(
          :individual,
          Anthropic::UserProfileExternalUserEntityType::TaggedSymbol
        )
      BUSINESS =
        T.let(
          :business,
          Anthropic::UserProfileExternalUserEntityType::TaggedSymbol
        )
      NON_PROFIT =
        T.let(
          :non_profit,
          Anthropic::UserProfileExternalUserEntityType::TaggedSymbol
        )
      GOVERNMENT =
        T.let(
          :government,
          Anthropic::UserProfileExternalUserEntityType::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[Anthropic::UserProfileExternalUserEntityType::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
