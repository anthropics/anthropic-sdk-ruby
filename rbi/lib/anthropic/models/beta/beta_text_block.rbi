# typed: strong

module Anthropic
  module Models
    BetaTextBlock = T.type_alias { Beta::BetaTextBlock }

    module Beta
      class BetaTextBlock < Anthropic::BaseModel
        Shape = T.type_alias do
          {
            citations: T.nilable(T::Array[Anthropic::Models::Beta::BetaTextCitation::Variants]),
            text: String,
            type: Symbol
          }
        end

        sig { returns(T.nilable(T::Array[Anthropic::Models::Beta::BetaTextCitation::Variants])) }
        attr_accessor :citations

        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            citations: T.nilable(T::Array[Anthropic::Models::Beta::BetaTextCitation::Variants]),
            text: String,
            type: Symbol
          ).void
        end
        def initialize(citations:, text:, type: :text); end

        sig { returns(Anthropic::Models::Beta::BetaTextBlock::Shape) }
        def to_h; end
      end
    end
  end
end
