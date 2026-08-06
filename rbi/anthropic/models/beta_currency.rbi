# typed: strong

module Anthropic
  module Models
    module BetaCurrency
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::BetaCurrency) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      USD = T.let(:USD, Anthropic::BetaCurrency::TaggedSymbol)

      sig { override.returns(T::Array[Anthropic::BetaCurrency::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
