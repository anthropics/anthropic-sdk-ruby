# typed: strong

module Anthropic
  module Models
    BetaContentBlockSource = T.type_alias { Beta::BetaContentBlockSource }

    module Beta
      class BetaContentBlockSource < Anthropic::BaseModel
        Shape = T.type_alias do
          {content: Anthropic::Models::Beta::BetaContentBlockSource::Content::Variants, type: Symbol}
        end

        sig { returns(Anthropic::Models::Beta::BetaContentBlockSource::Content::Variants) }
        attr_accessor :content

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            content: Anthropic::Models::Beta::BetaContentBlockSource::Content::Variants,
            type: Symbol
          ).void
        end
        def initialize(content:, type: :content); end

        sig { returns(Anthropic::Models::Beta::BetaContentBlockSource::Shape) }
        def to_h; end

        class Content < Anthropic::Union
          abstract!

          Variants = T.type_alias do
            T.any(String, T::Array[Anthropic::Models::Beta::BetaContentBlockSourceContent::Variants])
          end

          BetaContentBlockSourceContentArray = T.type_alias do
            T::Array[Anthropic::Models::Beta::BetaContentBlockSourceContent::Variants]
          end

          sig do
            override.returns(
              [
                [NilClass, String],
                [NilClass, T::Array[Anthropic::Models::Beta::BetaContentBlockSourceContent::Variants]]
              ]
            )
          end
          private_class_method def self.variants; end
        end
      end
    end
  end
end
