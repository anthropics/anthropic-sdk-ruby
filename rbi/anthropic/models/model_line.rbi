# typed: strong

module Anthropic
  module Models
    # A Claude model line, such as `opus` or `sonnet`. More lines may be added as new
    # values.
    module ModelLine
      extend Anthropic::Internal::Type::Enum

      TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::ModelLine) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      HAIKU = T.let(:haiku, Anthropic::ModelLine::TaggedSymbol)
      SONNET = T.let(:sonnet, Anthropic::ModelLine::TaggedSymbol)
      OPUS = T.let(:opus, Anthropic::ModelLine::TaggedSymbol)
      FABLE = T.let(:fable, Anthropic::ModelLine::TaggedSymbol)
      MYTHOS = T.let(:mythos, Anthropic::ModelLine::TaggedSymbol)

      sig { override.returns(T::Array[Anthropic::ModelLine::TaggedSymbol]) }
      def self.values
      end
    end
  end
end
