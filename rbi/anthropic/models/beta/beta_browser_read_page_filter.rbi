# typed: strong

module Anthropic
  module Models
    BetaBrowserReadPageFilter = Beta::BetaBrowserReadPageFilter

    module Beta
      module BetaBrowserReadPageFilter
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Beta::BetaBrowserReadPageFilter)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ALL =
          T.let(:all, Anthropic::Beta::BetaBrowserReadPageFilter::TaggedSymbol)
        INTERACTIVE =
          T.let(
            :interactive,
            Anthropic::Beta::BetaBrowserReadPageFilter::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaBrowserReadPageFilter::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
