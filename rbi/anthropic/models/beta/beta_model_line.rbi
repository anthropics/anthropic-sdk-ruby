# typed: strong

module Anthropic
  module Models
    BetaModelLine = Beta::BetaModelLine

    module Beta
      # A Claude model line, such as `opus` or `sonnet`. More lines may be added as new
      # values.
      module BetaModelLine
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::Beta::BetaModelLine) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HAIKU = T.let(:haiku, Anthropic::Beta::BetaModelLine::TaggedSymbol)
        SONNET = T.let(:sonnet, Anthropic::Beta::BetaModelLine::TaggedSymbol)
        OPUS = T.let(:opus, Anthropic::Beta::BetaModelLine::TaggedSymbol)
        FABLE = T.let(:fable, Anthropic::Beta::BetaModelLine::TaggedSymbol)
        MYTHOS = T.let(:mythos, Anthropic::Beta::BetaModelLine::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaModelLine::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
