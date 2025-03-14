# typed: strong

module Anthropic
  module Models
    BetaContentBlockSource = T.type_alias { Beta::BetaContentBlockSource }

    module Beta
      class BetaContentBlockSource < Anthropic::BaseModel
        sig do
          returns(
            T.any(
              String,
              T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
            )
          )
        end
        def content
        end

        sig do
          params(
            _: T.any(
              String,
              T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
            )
          )
            .returns(
              T.any(
                String,
                T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
              )
            )
        end
        def content=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig do
          params(
            content: T.any(
              String,
              T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
            ),
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(content:, type: :content)
        end

        sig do
          override
            .returns(
              {
                content: T.any(
                  String,
                  T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
                ),
                type: Symbol
              }
            )
        end
        def to_hash
        end

        class Content < Anthropic::Union
          abstract!

          BetaContentBlockSourceContentArray = T.type_alias { T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)] }

          class << self
            sig do
              override
                .returns(
                  [String, T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]]
                )
            end
            def variants
            end
          end
        end
      end
    end
  end
end
