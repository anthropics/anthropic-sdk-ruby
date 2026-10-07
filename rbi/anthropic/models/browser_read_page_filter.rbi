# typed: strong

module Anthropic
  module Models
    module BrowserReadPageFilter
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, Anthropic::BrowserReadPageFilter) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      ALL = T.let(:all, Anthropic::BrowserReadPageFilter::TaggedSymbol)
      INTERACTIVE =
        T.let(:interactive, Anthropic::BrowserReadPageFilter::TaggedSymbol)

      sig do
        override.returns(
          T::Array[Anthropic::BrowserReadPageFilter::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
