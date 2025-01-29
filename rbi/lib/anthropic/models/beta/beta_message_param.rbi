# typed: strong

module Anthropic
  module Models
    BetaMessageParam = T.type_alias { Beta::BetaMessageParam }

    module Beta
      class BetaMessageParam < Anthropic::BaseModel
        Shape = T.type_alias do
          {content: Anthropic::Models::Beta::BetaMessageParam::Content::Variants, role: Symbol}
        end

        sig { returns(Anthropic::Models::Beta::BetaMessageParam::Content::Variants) }
        attr_accessor :content

        sig { returns(Symbol) }
        attr_accessor :role

        sig do
          params(content: Anthropic::Models::Beta::BetaMessageParam::Content::Variants, role: Symbol).void
        end
        def initialize(content:, role:); end

        sig { returns(Anthropic::Models::Beta::BetaMessageParam::Shape) }
        def to_h; end

        class Content < Anthropic::Union
          abstract!

          Variants = T.type_alias do
            T.any(String, T::Array[Anthropic::Models::Beta::BetaContentBlockParam::Variants])
          end

          BetaContentBlockParamArray = T.type_alias do
            T::Array[Anthropic::Models::Beta::BetaContentBlockParam::Variants]
          end

          sig do
            returns(
              [
                [NilClass, String],
                [NilClass, T::Array[Anthropic::Models::Beta::BetaContentBlockParam::Variants]]
              ]
            )
          end
          private_class_method def self.variants; end
        end

        class Role < Anthropic::Enum
          abstract!

          USER = :user
          ASSISTANT = :assistant

          sig { returns(T::Array[Symbol]) }
          def self.values; end
        end
      end
    end
  end
end
