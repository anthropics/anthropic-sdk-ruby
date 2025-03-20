# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaToolResultBlockParam < Anthropic::BaseModel
        sig { returns(String) }
        def tool_use_id
        end

        sig { params(_: String).returns(String) }
        def tool_use_id=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        def cache_control
        end

        sig do
          params(_: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
            .returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
        end
        def cache_control=(_)
        end

        sig do
          returns(
            T.nilable(
              T.any(
                String,
                T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
              )
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

        sig { returns(T.nilable(T::Boolean)) }
        def is_error
        end

        sig { params(_: T::Boolean).returns(T::Boolean) }
        def is_error=(_)
        end

        sig do
          params(
            tool_use_id: String,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            content: T.any(
              String,
              T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
            ),
            is_error: T::Boolean,
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result)
        end

        sig do
          override
            .returns(
              {
                tool_use_id: String,
                type: Symbol,
                cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
                content: T.any(
                  String,
                  T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
                ),
                is_error: T::Boolean
              }
            )
        end
        def to_hash
        end

        class Content < Anthropic::Union
          abstract!

          Variants =
            type_template(:out) do
              {
                fixed: T.any(
                  String,
                  T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
                )
              }
            end

          ContentArray =
            T.let(
              Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaToolResultBlockParam::Content::Content],
              Anthropic::Converter
            )

          class Content < Anthropic::Union
            abstract!

            Variants =
              type_template(:out) { {fixed: T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)} }
          end
        end
      end
    end

    BetaToolResultBlockParam = Beta::BetaToolResultBlockParam
  end
end
