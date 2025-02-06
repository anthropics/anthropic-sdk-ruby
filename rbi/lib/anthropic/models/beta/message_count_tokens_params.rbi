# typed: strong

module Anthropic
  module Models
    module Beta
      class MessageCountTokensParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        sig { returns(T::Array[Anthropic::Models::Beta::BetaMessageParam]) }
        attr_accessor :messages

        sig { returns(T.any(Symbol, String)) }
        attr_accessor :model

        sig { returns(T.nilable(T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]))) }
        attr_reader :system_

        sig { params(system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam])).void }
        attr_writer :system_

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
        attr_reader :tool_choice

        sig do
          params(
            tool_choice: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool
            )
          ).void
        end
        attr_writer :tool_choice

        sig do
          returns(
            T.nilable(
              T::Array[T.any(
                Anthropic::Models::Beta::BetaTool,
                Anthropic::Models::Beta::BetaToolComputerUse20241022,
                Anthropic::Models::Beta::BetaToolBash20241022,
                Anthropic::Models::Beta::BetaToolTextEditor20241022
              )]
            )
          )
        end
        attr_reader :tools

        sig do
          params(
            tools: T::Array[T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022
            )]
          ).void
        end
        attr_writer :tools

        sig { returns(T.nilable(T::Array[T.any(String, Symbol)])) }
        attr_reader :betas

        sig { params(betas: T::Array[T.any(String, Symbol)]).void }
        attr_writer :betas

        sig do
          params(
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: T.any(Symbol, String),
            system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
            tool_choice: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool
            ),
            tools: T::Array[T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022
            )],
            betas: T::Array[T.any(String, Symbol)],
            request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
          ).void
        end
        def initialize(
          messages:,
          model:,
          system_: nil,
          tool_choice: nil,
          tools: nil,
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
              model: T.any(Symbol, String),
              system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
              tool_choice: T.any(
                Anthropic::Models::Beta::BetaToolChoiceAuto,
                Anthropic::Models::Beta::BetaToolChoiceAny,
                Anthropic::Models::Beta::BetaToolChoiceTool
              ),
              tools: T::Array[T.any(
                Anthropic::Models::Beta::BetaTool,
                Anthropic::Models::Beta::BetaToolComputerUse20241022,
                Anthropic::Models::Beta::BetaToolBash20241022,
                Anthropic::Models::Beta::BetaToolTextEditor20241022
              )],
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

          sig do
            override.returns(
              [
                [NilClass, String],
                [NilClass, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]]
              ]
            )
          end
          private_class_method def self.variants
          end
        end

        class Tool < Anthropic::Union
          abstract!

          sig do
            override.returns(
              [
                [NilClass, Anthropic::Models::Beta::BetaTool],
                [NilClass, Anthropic::Models::Beta::BetaToolComputerUse20241022],
                [NilClass, Anthropic::Models::Beta::BetaToolBash20241022],
                [NilClass, Anthropic::Models::Beta::BetaToolTextEditor20241022]
              ]
            )
          end
          private_class_method def self.variants
          end
        end
      end
    end
  end
end
