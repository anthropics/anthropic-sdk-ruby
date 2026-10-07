# typed: strong

module Anthropic
  module Models
    BetaBrowserScrollDirection = Beta::BetaBrowserScrollDirection

    module Beta
      module BetaBrowserScrollDirection
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaBrowserScrollDirection)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        UP =
          T.let(:up, Anthropic::Beta::BetaBrowserScrollDirection::TaggedSymbol)
        DOWN =
          T.let(
            :down,
            Anthropic::Beta::BetaBrowserScrollDirection::TaggedSymbol
          )
        LEFT =
          T.let(
            :left,
            Anthropic::Beta::BetaBrowserScrollDirection::TaggedSymbol
          )
        RIGHT =
          T.let(
            :right,
            Anthropic::Beta::BetaBrowserScrollDirection::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaBrowserScrollDirection::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
