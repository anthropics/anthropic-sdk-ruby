# typed: strong

module Anthropic
  module Models
    BetaBillTo = Beta::BetaBillTo

    module Beta
      # Who is billed for a request.
      module BetaBillTo
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::Beta::BetaBillTo) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SELF = T.let(:self, Anthropic::Beta::BetaBillTo::TaggedSymbol)
        USER_PROFILE =
          T.let(:user_profile, Anthropic::Beta::BetaBillTo::TaggedSymbol)

        sig do
          override.returns(T::Array[Anthropic::Beta::BetaBillTo::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
