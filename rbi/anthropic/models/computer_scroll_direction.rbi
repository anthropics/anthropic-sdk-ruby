# typed: strong

module Anthropic
  module Models
    module ComputerScrollDirection
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::ComputerScrollDirection) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      UP = T.let(:up, Anthropic::ComputerScrollDirection::TaggedSymbol)
      DOWN = T.let(:down, Anthropic::ComputerScrollDirection::TaggedSymbol)
      LEFT = T.let(:left, Anthropic::ComputerScrollDirection::TaggedSymbol)
      RIGHT = T.let(:right, Anthropic::ComputerScrollDirection::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Anthropic::ComputerScrollDirection::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
