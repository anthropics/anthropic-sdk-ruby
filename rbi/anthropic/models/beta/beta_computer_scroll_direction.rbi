# typed: strong

module Anthropic
  module Models
    BetaComputerScrollDirection = Beta::BetaComputerScrollDirection

    module Beta
      module BetaComputerScrollDirection
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaComputerScrollDirection)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        UP =
          T.let(:up, Anthropic::Beta::BetaComputerScrollDirection::TaggedSymbol)
        DOWN =
          T.let(
            :down,
            Anthropic::Beta::BetaComputerScrollDirection::TaggedSymbol
          )
        LEFT =
          T.let(
            :left,
            Anthropic::Beta::BetaComputerScrollDirection::TaggedSymbol
          )
        RIGHT =
          T.let(
            :right,
            Anthropic::Beta::BetaComputerScrollDirection::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaComputerScrollDirection::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
