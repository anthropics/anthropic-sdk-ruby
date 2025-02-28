# typed: strong

module Anthropic
  module Models
    module Beta
      class MessageCountTokensParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        sig { returns(T::Array[Anthropic::Models::Beta::BetaMessageParam]) }
        def messages
        end

        sig do
          params(_: T::Array[Anthropic::Models::Beta::BetaMessageParam])
            .returns(T::Array[Anthropic::Models::Beta::BetaMessageParam])
        end
        def messages=(_)
        end

        sig { returns(T.any(Symbol, String)) }
        def model
        end

        sig { params(_: T.any(Symbol, String)).returns(T.any(Symbol, String)) }
        def model=(_)
        end

        sig { returns(T.nilable(T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]))) }
        def system_
        end

        sig do
          params(_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]))
            .returns(T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]))
        end
        def system_=(_)
        end

        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Models::Beta::BetaThinkingConfigEnabled,
                Anthropic::Models::Beta::BetaThinkingConfigDisabled
              )
            )
          )
        end
        def thinking
        end

        sig do
          params(
            _: T.any(
              Anthropic::Models::Beta::BetaThinkingConfigEnabled,
              Anthropic::Models::Beta::BetaThinkingConfigDisabled
            )
          )
            .returns(
              T.any(
                Anthropic::Models::Beta::BetaThinkingConfigEnabled,
                Anthropic::Models::Beta::BetaThinkingConfigDisabled
              )
            )
        end
        def thinking=(_)
        end

        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Models::Beta::BetaToolChoiceAuto,
                Anthropic::Models::Beta::BetaToolChoiceAny,
                Anthropic::Models::Beta::BetaToolChoiceTool,
                Anthropic::Models::Beta::BetaToolChoiceNone
              )
            )
          )
        end
        def tool_choice
        end

        sig do
          params(
            _: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool,
              Anthropic::Models::Beta::BetaToolChoiceNone
            )
          )
            .returns(
              T.any(
                Anthropic::Models::Beta::BetaToolChoiceAuto,
                Anthropic::Models::Beta::BetaToolChoiceAny,
                Anthropic::Models::Beta::BetaToolChoiceTool,
                Anthropic::Models::Beta::BetaToolChoiceNone
              )
            )
        end
        def tool_choice=(_)
        end

        sig do
          returns(
            T.nilable(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaTool,
                Anthropic::Models::Beta::BetaToolComputerUse20241022,
                Anthropic::Models::Beta::BetaToolBash20241022,
                Anthropic::Models::Beta::BetaToolTextEditor20241022,
                Anthropic::Models::Beta::BetaToolComputerUse20250124,
                Anthropic::Models::Beta::BetaToolBash20250124,
                Anthropic::Models::Beta::BetaToolTextEditor20250124
              )
              ]
            )
          )
        end
        def tools
        end

        sig do
          params(
            _: T::Array[
            T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022,
              Anthropic::Models::Beta::BetaToolComputerUse20250124,
              Anthropic::Models::Beta::BetaToolBash20250124,
              Anthropic::Models::Beta::BetaToolTextEditor20250124
            )
            ]
          )
            .returns(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaTool,
                Anthropic::Models::Beta::BetaToolComputerUse20241022,
                Anthropic::Models::Beta::BetaToolBash20241022,
                Anthropic::Models::Beta::BetaToolTextEditor20241022,
                Anthropic::Models::Beta::BetaToolComputerUse20250124,
                Anthropic::Models::Beta::BetaToolBash20250124,
                Anthropic::Models::Beta::BetaToolTextEditor20250124
              )
              ]
            )
        end
        def tools=(_)
        end

        sig { returns(T.nilable(T::Array[T.any(String, Symbol)])) }
        def betas
        end

        sig { params(_: T::Array[T.any(String, Symbol)]).returns(T::Array[T.any(String, Symbol)]) }
        def betas=(_)
        end

        sig do
          params(
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: T.any(Symbol, String),
            system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
            thinking: T.any(
              Anthropic::Models::Beta::BetaThinkingConfigEnabled,
              Anthropic::Models::Beta::BetaThinkingConfigDisabled
            ),
            tool_choice: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool,
              Anthropic::Models::Beta::BetaToolChoiceNone
            ),
            tools: T::Array[
            T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022,
              Anthropic::Models::Beta::BetaToolComputerUse20250124,
              Anthropic::Models::Beta::BetaToolBash20250124,
              Anthropic::Models::Beta::BetaToolTextEditor20250124
            )
            ],
            betas: T::Array[T.any(String, Symbol)],
            request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
          )
            .void
        end
        def initialize(
          messages:,
          model:,
          system_: nil,
          thinking: nil,
          tool_choice: nil,
          tools: nil,
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override
            .returns(
              {
                messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
                model: T.any(Symbol, String),
                system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
                thinking: T.any(
                  Anthropic::Models::Beta::BetaThinkingConfigEnabled,
                  Anthropic::Models::Beta::BetaThinkingConfigDisabled
                ),
                tool_choice: T.any(
                  Anthropic::Models::Beta::BetaToolChoiceAuto,
                  Anthropic::Models::Beta::BetaToolChoiceAny,
                  Anthropic::Models::Beta::BetaToolChoiceTool,
                  Anthropic::Models::Beta::BetaToolChoiceNone
                ),
                tools: T::Array[
                T.any(
                  Anthropic::Models::Beta::BetaTool,
                  Anthropic::Models::Beta::BetaToolComputerUse20241022,
                  Anthropic::Models::Beta::BetaToolBash20241022,
                  Anthropic::Models::Beta::BetaToolTextEditor20241022,
                  Anthropic::Models::Beta::BetaToolComputerUse20250124,
                  Anthropic::Models::Beta::BetaToolBash20250124,
                  Anthropic::Models::Beta::BetaToolTextEditor20250124
                )
                ],
                betas: T::Array[T.any(String, Symbol)],
                request_options: Anthropic::RequestOptions
              }
            )
        end
        def to_hash
        end

        class System < Anthropic::Union
          abstract!

          BetaTextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::Beta::BetaTextBlockParam] }

          sig { override.returns([[NilClass, String], [NilClass, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]]]) }
          private_class_method def self.variants
          end
        end

        class Tool < Anthropic::Union
          abstract!

          sig do
            override
              .returns(
                [[NilClass, Anthropic::Models::Beta::BetaTool], [NilClass, Anthropic::Models::Beta::BetaToolComputerUse20241022], [NilClass, Anthropic::Models::Beta::BetaToolBash20241022], [NilClass, Anthropic::Models::Beta::BetaToolTextEditor20241022], [NilClass, Anthropic::Models::Beta::BetaToolComputerUse20250124], [NilClass, Anthropic::Models::Beta::BetaToolBash20250124], [NilClass, Anthropic::Models::Beta::BetaToolTextEditor20250124]]
              )
          end
          private_class_method def self.variants
          end
        end
      end
    end
  end
end
