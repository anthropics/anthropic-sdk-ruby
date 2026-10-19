# typed: strong

module Anthropic
  module Models
    # The direction that a list of user profiles is sorted in.
    module UserProfileListOrder
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::UserProfileListOrder) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      # Oldest first when `order_by` is `created_at`, or names in ascending order when `order_by` is `name`.
      ASC = T.let(:asc, Anthropic::UserProfileListOrder::TaggedSymbol)

      # Newest first when `order_by` is `created_at`, or names in descending order when `order_by` is `name`. This is the default.
      DESC = T.let(:desc, Anthropic::UserProfileListOrder::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Anthropic::UserProfileListOrder::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
