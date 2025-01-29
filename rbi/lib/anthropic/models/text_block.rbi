# typed: strong

module Anthropic
  module Models
    class TextBlock < Anthropic::BaseModel
      Shape = T.type_alias do
        {citations: T::Array[Anthropic::Models::TextCitation::Variants], text: String, type: Symbol}
      end

      sig { returns(T::Array[Anthropic::Models::TextCitation::Variants]) }
      attr_accessor :citations

      sig { returns(String) }
      attr_accessor :text

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          citations: T::Array[Anthropic::Models::TextCitation::Variants],
          text: String,
          type: Symbol
        ).void
      end
      def initialize(citations:, text:, type: :text); end

      sig { returns(Anthropic::Models::TextBlock::Shape) }
      def to_h; end
    end
  end
end
