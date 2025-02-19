# typed: strong

module Anthropic
  module Models
    module Beta
      class MessageCreateParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        sig { returns(Integer) }
        def max_tokens
        end

        sig { params(_: Integer).returns(Integer) }
        def max_tokens=(_)
        end

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

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaMetadata)) }
        def metadata
        end

        sig { params(_: Anthropic::Models::Beta::BetaMetadata).returns(Anthropic::Models::Beta::BetaMetadata) }
        def metadata=(_)
        end

        sig { returns(T.nilable(T::Array[String])) }
        def stop_sequences
        end

        sig { params(_: T::Array[String]).returns(T::Array[String]) }
        def stop_sequences=(_)
        end

        sig { returns(T::Boolean) }
        def stream
        end

        sig { params(_: T::Boolean).returns(T::Boolean) }
        def stream=(_)
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

        sig { returns(T.nilable(Float)) }
        def temperature
        end

        sig { params(_: Float).returns(Float) }
        def temperature=(_)
        end

        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Models::Beta::BetaToolChoiceAuto,
                Anthropic::Models::Beta::BetaToolChoiceAny,
                Anthropic::Models::Beta::BetaToolChoiceTool
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
              Anthropic::Models::Beta::BetaToolChoiceTool
            )
          )
            .returns(
              T.any(
                Anthropic::Models::Beta::BetaToolChoiceAuto,
                Anthropic::Models::Beta::BetaToolChoiceAny,
                Anthropic::Models::Beta::BetaToolChoiceTool
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
                Anthropic::Models::Beta::BetaToolTextEditor20241022
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
              Anthropic::Models::Beta::BetaToolTextEditor20241022
            )
            ]
          )
            .returns(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaTool,
                Anthropic::Models::Beta::BetaToolComputerUse20241022,
                Anthropic::Models::Beta::BetaToolBash20241022,
                Anthropic::Models::Beta::BetaToolTextEditor20241022
              )
              ]
            )
        end
        def tools=(_)
        end

        sig { returns(T.nilable(Integer)) }
        def top_k
        end

        sig { params(_: Integer).returns(Integer) }
        def top_k=(_)
        end

        sig { returns(T.nilable(Float)) }
        def top_p
        end

        sig { params(_: Float).returns(Float) }
        def top_p=(_)
        end

        sig { returns(T.nilable(T::Array[T.any(String, Symbol)])) }
        def betas
        end

        sig { params(_: T::Array[T.any(String, Symbol)]).returns(T::Array[T.any(String, Symbol)]) }
        def betas=(_)
        end

        sig do
          params(
            max_tokens: Integer,
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: T.any(Symbol, String),
            stream: T::Boolean,
            metadata: Anthropic::Models::Beta::BetaMetadata,
            stop_sequences: T::Array[String],
            system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
            temperature: Float,
            tool_choice: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool
            ),
            tools: T::Array[
            T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022
            )
            ],
            top_k: Integer,
            top_p: Float,
            betas: T::Array[T.any(String, Symbol)],
            request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
          )
            .void
        end
        def initialize(
          max_tokens:,
          messages:,
          model:,
          stream:,
          metadata: nil,
          stop_sequences: nil,
          system_: nil,
          temperature: nil,
          tool_choice: nil,
          tools: nil,
          top_k: nil,
          top_p: nil,
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override
            .returns(
              {
                max_tokens: Integer,
                messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
                model: T.any(Symbol, String),
                metadata: Anthropic::Models::Beta::BetaMetadata,
                stop_sequences: T::Array[String],
                stream: T::Boolean,
                system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
                temperature: Float,
                tool_choice: T.any(
                  Anthropic::Models::Beta::BetaToolChoiceAuto,
                  Anthropic::Models::Beta::BetaToolChoiceAny,
                  Anthropic::Models::Beta::BetaToolChoiceTool
                ),
                tools: T::Array[
                T.any(
                  Anthropic::Models::Beta::BetaTool,
                  Anthropic::Models::Beta::BetaToolComputerUse20241022,
                  Anthropic::Models::Beta::BetaToolBash20241022,
                  Anthropic::Models::Beta::BetaToolTextEditor20241022
                )
                ],
                top_k: Integer,
                top_p: Float,
                betas: T::Array[T.any(String, Symbol)],
                request_options: Anthropic::RequestOptions
              }
            )
        end
        def to_hash
        end

        class Stream < Anthropic::Enum
          abstract!

          TRUE = T.let(true, T::Boolean)

          sig { override.returns(T::Array[T::Boolean]) }
          def self.values
          end
        end

        class System < Anthropic::Union
          abstract!

          BetaTextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::Beta::BetaTextBlockParam] }

          sig { override.returns([[NilClass, String], [NilClass, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]]]) }
          private_class_method def self.variants
          end
        end
      end
    end
  end
end
