# typed: strong

module Anthropic
  module Models
    class MessageCountTokensParams < Anthropic::BaseModel
      extend Anthropic::RequestParameters::Converter
      include Anthropic::RequestParameters

      sig { returns(T::Array[Anthropic::Models::MessageParam]) }
      def messages
      end

      sig { params(_: T::Array[Anthropic::Models::MessageParam]).returns(T::Array[Anthropic::Models::MessageParam]) }
      def messages=(_)
      end

      sig { returns(T.any(Symbol, String)) }
      def model
      end

      sig { params(_: T.any(Symbol, String)).returns(T.any(Symbol, String)) }
      def model=(_)
      end

      sig { returns(T.nilable(T.any(String, T::Array[Anthropic::Models::TextBlockParam]))) }
      def system_
      end

      sig do
        params(_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]))
          .returns(T.any(String, T::Array[Anthropic::Models::TextBlockParam]))
      end
      def system_=(_)
      end

      sig do
        returns(
          T.nilable(T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled))
        )
      end
      def thinking
      end

      sig do
        params(_: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled))
          .returns(T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled))
      end
      def thinking=(_)
      end

      sig do
        returns(
          T.nilable(
            T.any(
              Anthropic::Models::ToolChoiceAuto,
              Anthropic::Models::ToolChoiceAny,
              Anthropic::Models::ToolChoiceTool,
              Anthropic::Models::ToolChoiceNone
            )
          )
        )
      end
      def tool_choice
      end

      sig do
        params(
          _: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool,
            Anthropic::Models::ToolChoiceNone
          )
        )
          .returns(
            T.any(
              Anthropic::Models::ToolChoiceAuto,
              Anthropic::Models::ToolChoiceAny,
              Anthropic::Models::ToolChoiceTool,
              Anthropic::Models::ToolChoiceNone
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
              Anthropic::Models::Tool,
              Anthropic::Models::ToolBash20250124,
              Anthropic::Models::ToolTextEditor20250124
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
            Anthropic::Models::Tool,
            Anthropic::Models::ToolBash20250124,
            Anthropic::Models::ToolTextEditor20250124
          )
          ]
        )
          .returns(
            T::Array[
            T.any(
              Anthropic::Models::Tool,
              Anthropic::Models::ToolBash20250124,
              Anthropic::Models::ToolTextEditor20250124
            )
            ]
          )
      end
      def tools=(_)
      end

      sig do
        params(
          messages: T::Array[Anthropic::Models::MessageParam],
          model: T.any(Symbol, String),
          system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
          thinking: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled),
          tool_choice: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool,
            Anthropic::Models::ToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Anthropic::Models::Tool,
            Anthropic::Models::ToolBash20250124,
            Anthropic::Models::ToolTextEditor20250124
          )
          ],
          request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
        )
          .returns(T.attached_class)
      end
      def self.new(messages:, model:, system_: nil, thinking: nil, tool_choice: nil, tools: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              messages: T::Array[Anthropic::Models::MessageParam],
              model: T.any(Symbol, String),
              system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
              thinking: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled),
              tool_choice: T.any(
                Anthropic::Models::ToolChoiceAuto,
                Anthropic::Models::ToolChoiceAny,
                Anthropic::Models::ToolChoiceTool,
                Anthropic::Models::ToolChoiceNone
              ),
              tools: T::Array[
              T.any(
                Anthropic::Models::Tool,
                Anthropic::Models::ToolBash20250124,
                Anthropic::Models::ToolTextEditor20250124
              )
              ],
              request_options: Anthropic::RequestOptions
            }
          )
      end
      def to_hash
      end

      class System < Anthropic::Union
        abstract!

        TextBlockParamArray = T.type_alias { T::Array[Anthropic::Models::TextBlockParam] }

        class << self
          sig { override.returns([[NilClass, String], [NilClass, T::Array[Anthropic::Models::TextBlockParam]]]) }
          private def variants
          end
        end
      end
    end
  end
end
