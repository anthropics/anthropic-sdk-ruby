# typed: strong

module Anthropic
  module Models
    module BrowserScrollDirection
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::BrowserScrollDirection) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      UP = T.let(:up, Anthropic::BrowserScrollDirection::TaggedSymbol)
      DOWN = T.let(:down, Anthropic::BrowserScrollDirection::TaggedSymbol)
      LEFT = T.let(:left, Anthropic::BrowserScrollDirection::TaggedSymbol)
      RIGHT = T.let(:right, Anthropic::BrowserScrollDirection::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Anthropic::BrowserScrollDirection::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
