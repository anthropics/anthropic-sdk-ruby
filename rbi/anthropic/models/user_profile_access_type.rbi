# typed: strong

module Anthropic
  module Models
    # How the platform uses the API on behalf of the entity this profile represents.
    # `application`: the platform sells a product that uses the API behind the scenes,
    # and the profile represents an individual end-user of that product.
    # `passthrough`: the platform resells raw inference, and the profile identifies
    # the resold-to company.
    module UserProfileAccessType
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::UserProfileAccessType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      # The user profile represents an individual end-user of a product that the platform builds on the API. New profiles get this value by default.
      APPLICATION =
        T.let(:application, Anthropic::UserProfileAccessType::TaggedSymbol)

      # The user profile represents a company that the platform resells Claude access to.
      PASSTHROUGH =
        T.let(:passthrough, Anthropic::UserProfileAccessType::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Anthropic::UserProfileAccessType::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
